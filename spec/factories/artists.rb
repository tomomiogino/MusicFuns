FactoryBot.define do
  factory :artist do
    name { "UVERworld" }
    image { open("#{Rails.root}/public/seed_img/e5bc0b54a22bb44ee024b156e08df3142282ea4e.jpeg") }
  end
end
