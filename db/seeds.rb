# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts 'Cleaning database...'
User.destroy_all
Guest.destroy_all
Event.destroy_all
Whishlist.destroy_all
Item.destroy_all
Basket.destroy_all

puts 'Creating users...'
sam = User.create!(nickname: 'Samir', email: 'sam@gmail.com', password: 'azerty')
remi = User.create!(nickname: 'Remi', email: 'rem@gmail.com', password: 'azerty')
flo = User.create!(nickname: 'flo', email: 'flo@gmail.com', password: 'azerty')
susan = User.create!(nickname: 'susan', email: 'sus@gmail.com', password: 'azerty')



puts 'Creating event...'
event_1 = Event.create!(user_id: 1, title: "raclette", description: "ce sera bien", address: "16 villa gaudelet", date: Date.today)


puts 'Creating guests...'
g1 = Guest.create!(user_id: 4, event_id: 1, is_coming: nil)
g2 = Guest.create!(user_id: 2, event_id: 1, is_coming: nil)
g3 = Guest.create!(user_id: 3, event_id: 1, is_coming: nil)

puts 'Creating 10 vegetables items...'
10.times do
  item = Item.create!(
    name: Faker::Food.vegetables,
    category: "légumes"
  )
end


puts 'Creating whishlist...'
ingredient_1 = Whishlist.create!(item_id: 4, event_id: 1, quantity: 4)
ingredient_2 = Whishlist.create!(item_id: 6, event_id: 1, quantity: 2)
ingredient_3 = Whishlist.create!(item_id: 2, event_id: 1, quantity: 5)
ingredient_4 = Whishlist.create!(item_id: 7, event_id: 1, quantity: 3)

puts 'Creating basket...'
my_basket1 = Basket.create!(whishlist_id: 1, user_id: 3, quantity: 4)
my_basket2 = Basket.create!(whishlist_id: 1, user_id: 3, quantity: 2)


puts 'Finished!'


