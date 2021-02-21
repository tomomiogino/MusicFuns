require 'rails_helper'

RSpec.describe 'ユーザー管理機能', type: :system do
  let!(:user1) { create(:user) }
  let!(:user2) { create(:second_user) }

  describe 'ユーザ登録機能' do
    context 'ユーザが正しい入力内容で新規登録をした場合' do
      it 'マイページに登録内容が表示される' do
        visit new_user_path
        fill_in '名前', with: 'test_user'
        fill_in 'メールアドレス', with: 'test@example.com'
        fill_in 'パスワード', with: '123456'
        fill_in 'パスワード(確認)', with: '123456'
        click_on "登録する"
        expect(page).to have_content 'test_userさん'
      end
    end
    context 'ユーザが正しくない入力内容で新規登録した場合' do
      it 'フラッシュメッセージとエラーメッセージが表示される' do
        visit new_user_path
        fill_in '名前', with: ''
        fill_in 'メールアドレス', with: 'test@example.com'
        fill_in 'パスワード', with: '123456'
        fill_in 'パスワード(確認)', with: '123456'
        click_on "登録する"
        expect(page).to have_content '登録に失敗しました'
        expect(page).to have_content '名前を入力してください'
      end
    end
  end

  describe 'セッション機能' do
    context 'ログイン画面の入力情報がユーザーの登録情報と一致した場合' do
      it 'ログインする' do
        visit new_session_path
        fill_in 'メールアドレス', with: 'test1@example.com'
        fill_in "パスワード", with: '123456'
        click_button 'ログイン'
        expect(page).to have_content 'ログインしました！'
        expect(current_path).to eq artists_path
      end
    end
    context 'ユーザがログインしている場合' do
      before do
        visit new_session_path
        fill_in 'メールアドレス', with: 'test1@example.com'
        fill_in "パスワード", with: '123456'
        click_button 'ログイン'
      end
      it '自分の詳細画面に飛べる' do
        visit user_path(user1.id)
        expect(page).to have_content "#{user1.name}さん"
        expect(page).to have_content "プロフィールを編集"
      end
      it '他人の詳細画面に飛べる' do
        visit user_path(user2.id)
        expect(page).to have_content "#{user2.name}さん"
        expect(page).not_to have_content "プロフィールを編集"
      end
      it 'ユーザー新規登録画面に飛ぶとアーティスト一覧画面に遷移する' do
        visit new_user_path
        expect(current_path).to eq artists_path
        expect(page).to have_content "ログイン済みです"
      end
      it 'ログイン画面に飛ぶとアーティスト一覧画面に遷移する' do
        visit new_session_path
        expect(current_path).to eq artists_path
        expect(page).to have_content "ログイン済みです"
      end
      it 'ログアウトができる' do
        click_link 'navbarDropdownMenu'
        click_link 'ログアウト'
        expect(current_path).to eq new_session_path
        expect(page).to have_content 'ログアウトしました'
        visit user_path(user1.id)
        expect(current_path).to eq new_session_path
        expect(page).to have_content 'ログインが必要です'
      end
    end
  end

  describe 'プロフィール編集機能テスト' do
    before do
      visit new_session_path
      fill_in 'メールアドレス', with: 'test1@example.com'
      fill_in "パスワード", with: '123456'
      click_button 'ログイン'
    end
    context '自分のプロフィール編集画面にアクセスした場合' do
      it 'プロフィール編集画面にアクセスできる' do
        visit edit_user_path(user1.id)
        expect(current_path).to eq edit_user_path(user1.id)
        expect(page).to have_content 'プロフィールを編集する'
        expect(page).to have_content 'テストユーザー1'
      end
      it '正しい変更内容を入力するとユーザー情報が更新される' do
        visit edit_user_path(user1.id)
        fill_in '名前', with: 'てすとゆーざー1'
        fill_in 'メールアドレス', with: 'test1@example.com'
        click_button '更新する'
        expect(page).to have_content "プロフィールを更新しました！"
        expect(page).to have_content "てすとゆーざー1"
        expect(page).not_to have_content "テストユーザー1"
      end
      it '正しくない変更内容を入力するとユーザー情報の更新が失敗する' do
        visit edit_user_path(user1.id)
        fill_in '名前', with: ''
        fill_in 'メールアドレス', with: 'test1@example.com'
        click_button '更新する'
        expect(page).to have_content "プロフィールの更新に失敗しました"
        expect(page).to have_content "プロフィールを編集する"
      end
    end
    context '他人のプロフィール編集画面にアクセスした場合' do
      it 'プロフィール編集画面にアクセスできない' do
        visit edit_user_path(user2.id)
        expect(current_path).to_not eq edit_user_path(user2.id)
        expect(current_path).to eq artists_path
        expect(page).to have_content '権限がありません'
      end
    end
  end
end
