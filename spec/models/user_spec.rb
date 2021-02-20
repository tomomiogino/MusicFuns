require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { create(:user) }

  describe 'バリデーションのテスト' do
    context '名前が空の場合' do
      it 'バリデーションにひっかる' do
        user.name = ''
        expect(user).not_to be_valid
      end
    end
    context '名前が20文字を超える長さの場合' do
      it 'バリデーションにひっかかる' do
        user.name = 'a' * 21
        expect(user).not_to be_valid
      end
    end
    context 'メールアドレスが空の場合' do
      it 'バリデーションにひっかかる' do
        user.email = ''
        expect(user).not_to be_valid
      end
    end
    context 'メールアドレスが255文字を超える長さの場合' do
      it 'バリデーションにひっかかる' do
        user.email = "#{'a' * 244}@example.com"
        test_user = User.new(name: 'a' * 20, email: "#{'a' * 243}@example.com", password: '123456')
        expect(user).not_to be_valid
        expect(test_user).to be_valid
      end
    end
    context 'メールアドレスのフォーマットが正しくない場合' do
      it 'バリデーションにひっかかる' do
        user.email = 'email'
        expect(user).not_to be_valid
      end
    end
    context '重複したメールアドレスの場合' do
      it 'バリデーションにひっかかる' do
        test_user = User.new(name: 'a' * 20, email: 'test1@example.com', password: '123456')
        expect(test_user).not_to be_valid
      end
    end
    context 'メールアドレスに大文字が含まれている場合' do
      it '小文字で保存される' do
        test_user = User.new(name: 'a' * 20, email: 'TEST1@example.com', password: '123456')
        expect(user.email).to eq 'test1@example.com'
      end
    end
    context 'インスタンス作成時、パスワードが空の場合' do
      it 'バリデーションにひっかかる' do
        test_user = User.new(name: 'a' * 20, email: 'test@example.com', password: '')
        expect(test_user).not_to be_valid
      end
    end
    context 'インスタンス作成時、パスワードが6文字未満の場合' do
      it 'バリデーションにひっかかる' do
        test_user = User.new(name: 'a' * 20, email: 'test@example.com', password: '12345')
        expect(test_user).not_to be_valid
      end
    end
    context 'プロフィールコメントが255文字を超える長さの場合' do
      it 'バリデーションにひっかかる' do
        user.profile_comment = 'a' * 256
        expect(user).not_to be_valid
      end
    end
    context '名前が20文字以内で記載されている、且つ重複しないメールアドレスが正しいフォーマットで255文字以内で記載されている、且つパスワードが6文字以上で記載されている場合' do
      it 'バリデーションが通る' do
        user = User.new(name: 'a' * 20, email: 'test@example.com', password: '123456')
        expect(user).to be_valid
      end
    end
  end
end
