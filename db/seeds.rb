# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
response = open('http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read
ingredients = JSON.parse(response)
# p ingredients

10.times do
  description = Faker::Food.measurement
  Dose.create(description:description)
  name = Faker::Book.title
  Cocktail.create(name: name)
  Ingredient.create(name:ingredients["drinks"].sample["strIngredient1"])
end
