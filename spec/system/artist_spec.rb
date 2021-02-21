require 'rails_helper'
# bundle exec rspec spec/system/artist_spec.rb
RSpec.describe 'アーティスト管理機能', type: :system do
  let!(:user1) { create(:user) }
  let!(:artist1) { create(:artist) }

  describe 'アーティストページ作成機能' do
    before do
      visit new_session_path
      fill_in 'メールアドレス', with: 'test1@example.com'
      fill_in "パスワード", with: '123456'
      click_button 'ログイン'
      expect(page).to have_content 'ログインしました！'
    end
    context 'アーティストページがまだない場合' do
      it 'ページ未作成のアーティストとして表示される' do
        fill_in 'search', with: 'ELLEGARDEN'
        click_on '検索'
        within("#unregistered_artist") do
          expect(page).to have_content 'ELLEGARDEN'
        end
      end
      it 'アーティストページ作成ボタンが表示される' do
        fill_in 'search', with: 'ELLEGARDEN'
        click_on '検索'
        within("#unregistered_artist") do
          expect(page).to have_content 'アーティストページ作成'
        end
      end
    end

    context 'アーティストページが作成済の場合' do
      it '検索結果に表示される' do
        fill_in 'search', with: 'UVERworld'
        click_on '検索'
        within("#registered_artist") do
          expect(page).to have_content 'UVERworld'
        end
      end
      it 'アーティストページへボタンが表示される' do
        fill_in 'search', with: 'UVERworld'
        click_on '検索'
        within("#registered_artist") do
          expect(page).to have_content 'アーティストページへ'
        end
      end
    end
  end
end
