require 'rails_helper'

RSpec.describe Artist, type: :model do
  let!(:artist) { create(:artist) }

  describe 'バリデーションのテスト' do
    context 'アーティスト名が空の場合' do
      it 'バリデーションにひっかる' do
        artist.name = ''
        expect(artist).not_to be_valid
      end
    end
    context 'アーティスト名が記載されている場合' do
      it 'バリデーションが通る' do
        test_artist = Artist.new(name: 'ELLEGARDEN')
        expect(test_artist).to be_valid
      end
    end
  end
end
