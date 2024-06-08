# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#
5.times {
  User.create!(
    nickname: Faker::Name.name,
    email: Faker::Internet.email,
    password: "Password1",
    password_confirmation: "Password1"
  )
}

20.times do |index|
  Post.create!(
    user_id: User.offset(rand(User.count)).first.id,
    content: "content_#{index}",
    genre: Post.genres.keys.sample
  )
end
