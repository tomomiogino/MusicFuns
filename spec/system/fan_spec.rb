require 'rails_helper'
# bundle exec rspec spec/system/artist_spec.rb
RSpec.describe 'ファン管理機能', type: :system do
  let!(:user1) { create(:user) }
  let!(:artist1) { create(:artist) }

  describe 'ファン登録機能' do
    before do
      visit new_session_path
      fill_in 'メールアドレス', with: 'test1@example.com'
      fill_in "パスワード", with: '123456'
      click_button 'ログイン'
    end
    context 'ファン登録をまだしていない場合' do
      it 'アーティスト詳細ページにファン登録ボタンが表示される' do
        fill_in 'search', with: 'UVERworld'
        click_on '検索'
        click_on 'アーティストページへ', match: :first
        expect(page).to have_content 'ファン登録'
      end
      it 'アーティスト詳細ページでアーティストをファン登録できる' do
        fill_in 'search', with: 'UVERworld'
        click_on '検索'
        click_on 'アーティストページへ', match: :first
        click_on 'ファン登録'
        expect(page).to have_content '『UVERworld』をファン登録しました！'
      end
    end

    context 'ファン登録している場合' do
      it 'アーティスト詳細ページにファン登録解除ボタンが表示される' do
        create(:fan, artist_id: artist1.id, user_id: user1.id)
        fill_in 'search', with: 'UVERworld'
        click_on '検索'
        click_on 'アーティストページへ', match: :first
        expect(page).to have_content 'ファン登録解除'
      end
      it 'アーティスト詳細ページでアーティストをファン登録解除できる' do
        create(:fan, artist_id: artist1.id, user_id: user1.id)
        fill_in 'search', with: 'UVERworld'
        click_on '検索'
        click_on 'アーティストページへ', match: :first
        click_on 'ファン登録解除'
        expect(page).to have_content '『UVERworld』のファン登録を解除しました'
      end
    end
  end
end
