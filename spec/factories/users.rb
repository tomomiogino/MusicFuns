FactoryBot.define do
  factory :user do
    name { "テストユーザー1" }
    email { "test1@example.com" }
    password { "123456" }
    profile_comment { "テストコメント1" }
    image { open("#{Rails.root}/public/seed_img/user_1.png") }
  end

  factory :second_user, class: User do
    name { "テストユーザー2" }
    email { "test2@example.com" }
    password { "123456" }
    profile_comment { "よろしく！" }
    image { open("#{Rails.root}/public/seed_img/user_2.png") }
  end
end
