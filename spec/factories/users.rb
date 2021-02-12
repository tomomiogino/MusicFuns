FactoryBot.define do
  factory :user do
    name { "MyString" }
    email { "MyString" }
    password_digest { "MyString" }
    profile_comment { "MyText" }
    image { "MyText" }
  end
end
