User.create!(name: "Example user",
            email: "example@railstutorial.org",
            password: "foobar",
            password_confirmation: "foobar",
            admin: true,
            activated: true,
            activated_at: Time.zone.now )

99.times do |i|
  name = Faker::TvShows::RickAndMorty.character
  email = "example-#{i + 1}@railstutorial.org"
  password = "password"
  User.create!(name: name,
              email: email,
              password: password,
              password_confirmation: password,
              activated: true,
              activated_at: Time.zone.now )
end

users = User.order(:created_at).take(6)
50.times do
  content = Faker::TvShows::RickAndMorty.quote
  users.each { |user|
    user.microposts.create(content: content)
  }
end

# Create following relationships.
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
