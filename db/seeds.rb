# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Article.destroy_all

users = User.all
users.each do |user|
  1.times do
    article = user.articles.create(
      post_date: Faker::Date.between(from: 1.year.ago, to: Date.today),
      title: Faker::Lorem.sentence,
      content: Faker::Lorem.paragraphs.join("\n\n")
    )
    puts "Created article '#{article.title}' by #{user.email}"
  end
end