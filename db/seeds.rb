# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

30.times do |n|
  name = Faker::Sports::Football.player
  password = "password"
  profile_comment = Faker::Sports::Football.position
  User.create!(name: name,
               email: "test#{n + 1}@example.com",
               password: password,
               password_confirmation: password,
               profile_comment: profile_comment,
               image: open("./public/seed_img/user_#{n + 1}.png")
               )
end

users = User.all
user = users.first
following = users[2..29]
followers = users[3..28]
following.each { |followed| user.follow!(followed) }
followers.each { |follower| follower.follow!(user) }

Artist.create!(name: "UVERworld",
               image: open("./public/seed_img/e5bc0b54a22bb44ee024b156e08df3142282ea4e.jpeg")
              )
Artist.create!(name: "ELLEGARDEN",
               image: open("./public/seed_img/71fb44bf7e1cfcfce113fa74b672578382a3a1fa.jpeg")
              )

Artist.create!(name: "ONE OK ROCK",
               image: open("./public/seed_img/0f9fca7e9d00ee9b64a324efa0d460575cb98b45.jpeg")
              )

Artist.create!(name: "MONOEYES",
               image: open("./public/seed_img/6ae9adcd44cd8f0d34f716e09d97cf2eafd99888.jpeg")
              )

Artist.create!(name: "Hi-STANDARD",
               image: open("./public/seed_img/736d0f2e3a5a6fefed2b4cc984b5b690a08aa569.jpeg")
              )

Artist.create!(name: "MAN WITH A MISSION",
               image: open("./public/seed_img/0f1f4706877b5d8161c19f3009fad1a2c3b0d7a4.jpeg")
              )

Artist.create!(name: "the HIATUS",
               image: open("./public/seed_img/9beca6e742177d1f991b32a3f4d66f8e419fdabf.jpeg")
              )

Artist.create!(name: "King Gnu",
               image: open("./public/seed_img/78b1f0f899a34b26a0c80b40e9600b097d298859.jpeg")
              )

Artist.create!(name: "NiziU",
               image: open("./public/seed_img/88f1a8a9087a2d5ffc2083f3a83b348616dfc490.jpeg")
              )

Artist.create!(name: "aiko",
               image: open("./public/seed_img/143db91fa74a83d48f3fc32f4542158f0952f66c.jpeg")
              )
Artist.create!(name: "coldrain",
               image: open("./public/seed_img/eb624db0b8d9cdf989149e0e981edb235a0df024.jpeg")
              )
Artist.create!(name: "BRAHMAN",
               image: open("./public/seed_img/6589de83887e54e9f53cd7d58e202237cf756834.jpeg")
              )
Artist.create!(name: "[Alexandros]",
               image: open("./public/seed_img/d863fdf54dd6a35d03eeffdf2d6fd9b57f1c3414.jpeg")
              )
Artist.create!(name: "Dragon Ash",
               image: open("./public/seed_img/7298a05eb5c50d0cb3e374bf25ddd252e6c9c29f.jpeg")
              )
Artist.create!(name: "BUMP OF CHICKEN",
               image: open("./public/seed_img/e7f15db69f920cfdce668da5f09b4a066114ca8a.jpeg")
              )
Artist.create!(name: "Straightener",
               image: open("./public/seed_img/1aba4b835e6afd1ab511de517be7c0da83abfaf1.jpeg")
              )
Artist.create!(name: "10-FEET",
               image: open("./public/seed_img/49d7741c364f5b1a752ae6795765f4b85d3e972c.jpeg")
              )
Artist.create!(name: "Hawaiian6",
               image: open("./public/seed_img/4b37935aa4125272da06d723f65bc67b0edd8edb.jpeg")
              )
Artist.create!(name: "SiM",
               image: open("./public/seed_img/59a6238fbd9c0549dbaafc5a7ca56ec29e5c3102.jpeg")
              )
Artist.create!(name: "GLAY",
               image: open("./public/seed_img/c1339f88ea8403928d8217ec5462d51e72debd97.jpeg")
              )

Artist.all.each do |artist|
  artist.channels.create!(name: "サンプル")
end

Artist.all.ids.sort.each do |artist_id|
  User.all.ids.sort.each do |user_id|
    Fan.create!(artist_id: artist_id, user_id: user_id)
  end
end

Channel.all.each do |channel|
  channel.comments.create!(content: "#{channel.artist.name}好きな人！", user_id: rand(1..30))
  channel.comments.create!(content: "私も#{channel.artist.name}好きです！", user_id: rand(1..30))
  channel.comments.create!(content: "#{channel.artist.name}好きな人周りにいなかったからこのチャンネルありがたい！", user_id: rand(1..30))
  channel.comments.create!(content: "みなさんのお気に入りの曲挙げてきいましょー♪", user_id: rand(1..30))
end
