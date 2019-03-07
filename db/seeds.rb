# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
puts 'Cleaning wishlists...'
Whishlist.destroy_all
puts 'Cleaning items...'
Item.destroy_all
puts 'Cleaning baskets...'
Basket.destroy_all
puts 'Cleaning events...'
Event.destroy_all
puts 'Cleaning guests...'
Guest.destroy_all
puts 'Cleaning users...'
User.destroy_all

puts 'Creating users...'

sam = User.create!(nickname: 'Samir', email: 'sam@gmail.com', password: 'azerty', photo: 'icons/user.png')
remi = User.create!(nickname: 'Remi', email: 'rem@gmail.com', password: 'azerty', photo: 'icons/user.png')
flo = User.create!(nickname: 'Flo', email: 'flo@gmail.com', password: 'azerty', photo: 'icons/user.png')
susan = User.create!(nickname: 'Susan', email: 'sus@gmail.com', password: 'azerty', photo: 'icons/user.png')

puts 'Creating event...'

event_1 = Event.create!(user_id: sam.id, title: "raclette", description: "ce sera bien", address: "16 villa gaudelet", date: Date.today)
event_2 = Event.create!(user_id: remi.id, title: "couscous", description: "pétage de bid", address: "chez ma maman", date: Date.today)

puts 'Creating guests...'
g1 = Guest.create!(user_id: remi.id, event_id: event_1.id, is_coming: true)
g2 = Guest.create!(user_id: flo.id, event_id: event_1.id, is_coming: true)
g3 = Guest.create!(user_id: susan.id, event_id: event_1.id, is_coming: true)
g4 = Guest.create!(user_id: sam.id, event_id: event_1.id, is_coming: true)
g5 = Guest.create!(user_id: flo.id, event_id: event_2.id, is_coming: true)

puts 'Creating items...'
beer = Item.create!(name: "Bière", category: "alcool", icon: "icons/beer.png")
bone = Item.create!(name: "Rôti", category: "salé", icon: "icons/bone.png")
bread = Item.create!(name: "Pain", category: "salé", icon: "icons/bread.png")
brochettes = Item.create!(name: "Brochettes", category: "salé", icon: "icons/brochettes.png")
burger = Item.create!(name: "Burger", category: "salé", icon: "icons/burger.png")
champagne = Item.create!(name: "Champagne", category: "alcool", icon: "icons/champagne.png")
cheese = Item.create!(name: "Fromage", category: "salé", icon: "icons/cheese.png")
chicken = Item.create!(name: "Poulet", category: "salé", icon: "icons/chicken.png")
coke = Item.create!(name: "Coca-cola", category: "soft", icon: "icons/coke.png")
croissant = Item.create!(name: "Croissant", category: "sucré", icon: "icons/croissant.png")
frenchfries = Item.create!(name: "Frites", category: "salé", icon: "icons/frenchfries.png")
gin = Item.create!(name: "Gin", category: "alcool", icon: "icons/gin.png")
hotdog = Item.create!(name: "Hotdog", category: "salé", icon: "icons/hotdog.png")
ketchup = Item.create!(name: "Ketchup", category: "salé", icon: "icons/ketchup.png")
milk = Item.create!(name: "Lait", category: "soft", icon: "icons/milk.png")
orangejuice = Item.create!(name: "Orange", category: "soft", icon: "icons/orangejuice.png")
pizza = Item.create!(name: "Pizza", category: "salé", icon: "icons/pizza.png")
popcorn = Item.create!(name: "Popcorn", category: "sucré", icon: "icons/popcorn.png")
potato = Item.create!(name: "Pomme de terre", category: "salé", icon: "icons/potato.png")
potatochip = Item.create!(name: "Chips", category: "salé", icon: "icons/potatochip.png")
rhum = Item.create!(name: "Rhum", category: "alcool", icon: "icons/rhum.png")
sausage = Item.create!(name: "Saucisse", category: "salé", icon: "icons/sausage.png")
steak = Item.create!(name: "Steak", category: "salé", icon: "icons/steak.png")
tequila = Item.create!(name: "Tequila", category: "alcool", icon: "icons/tequila.png")
tomato = Item.create!(name: "Tomate", category: "salé", icon: "icons/tomato.png")
vodka = Item.create!(name: "Vodka", category: "alcool", icon: "icons/vodka.png")
cake = Item.create!(name: "Cake", category: "sucré", icon: "icons/cake.png")
donut = Item.create!(name: "Donut", category: "sucré", icon: "icons/donut.png")
cookie = Item.create!(name: "Cookie", category: "sucré", icon: "icons/cookie.png")
ice-cream = Item.create!(name: "Ice-cream", category: "sucré", icon: "icons/ice-cream.png")
milkshake = Item.create!(name: "Milkshake", category: "sucré", icon: "icons/milkshake.png")
miel = Item.create!(name: "Miel", category: "sucré", icon: "icons/miel.png")
sucette = Item.create!(name: "Sucette", category: "sucré", icon: "icons/sucette.png")
tarte = Item.create!(name: "Tarte", category: "sucré", icon: "icons/tarte.png")
muffin = Item.create!(name: "Muffin", category: "sucré", icon: "icons/muffin.png")


puts 'Creating whishlist...'

ingredient_1 = Whishlist.create!(item_id: Item.first.id, event_id: event_1.id, quantity: 0)
ingredient_2 = Whishlist.create!(item_id: Item.second.id, event_id: event_1.id, quantity: 0)
ingredient_3 = Whishlist.create!(item_id: Item.third.id, event_id: event_1.id, quantity: 0)
ingredient_4 = Whishlist.create!(item_id: Item.fourth.id, event_id: event_1.id, quantity: 0)
ingredient_5 = Whishlist.create!(item_id: Item.fifth.id, event_id: event_1.id, quantity: 0)


puts 'Creating basket...'
my_basket1 = Basket.create!(whishlist_id: Whishlist.first.id, user_id: remi.id, quantity: 2, price_in_cent: 0)
my_basket2 = Basket.create!(whishlist_id: Whishlist.second.id, user_id: flo.id, quantity: 2, price_in_cent: 0)
my_basket3 = Basket.create!(whishlist_id: Whishlist.third.id, user_id: sam.id, quantity: 1, price_in_cent: 0)
my_basket4 = Basket.create!(whishlist_id: Whishlist.fourth.id, user_id: susan.id, quantity: 2, price_in_cent: 0)



puts 'Finished!'


