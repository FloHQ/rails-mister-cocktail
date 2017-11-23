# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'
require 'faker'

puts "Let's seed!"
puts 'cleaning the DB'
Ingredient.destroy_all
Cocktail.destroy_all
puts 'DB cleaned'

puts "Seeding the DB"
url = "http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
ingredients = JSON.parse(open(url).read)

ingredients["drinks"].each do |b|
  ingredient = Ingredient.new(name: b["strIngredient1"])
  ingredient.save!
end

15.times do
  cocktail = Cocktail.new(name: Faker::Hipster.words(2).join(" ").capitalize)
  cocktail.save!
end

puts 'Seed in place!'
