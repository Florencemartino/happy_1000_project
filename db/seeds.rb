# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts 'Cleaning database...'
Item.destroy_all

puts 'Creating 10 vegetables items...'
10.times do
  item = Item.create!(
    name: Faker::Food.vegetables,
    category: "légumes"
  )
end
puts 'Finished!'


