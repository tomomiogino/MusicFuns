FactoryBot.define do
  factory :comment do
    content { "MyText" }
    channel { nil }
    user { nil }
  end
end
