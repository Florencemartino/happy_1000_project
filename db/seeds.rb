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
cake = Item.create!(name: "Cake", category: "sucré", icon: "icons/cake.png")
donut = Item.create!(name: "Donut", category: "sucré", icon: "icons/donut.png")
cookie = Item.create!(name: "Cookie", category: "sucré", icon: "icons/cookie.png")
icecream = Item.create!(name: "Ice-cream", category: "sucré", icon: "icons/icecream.png")
milkshake = Item.create!(name: "Milkshake", category: "soft", icon: "icons/milkshake.png")
miel = Item.create!(name: "Miel", category: "sucré", icon: "icons/miel.png")
sucette = Item.create!(name: "Sucette", category: "sucré", icon: "icons/sucette.png")
tarte = Item.create!(name: "Tarte", category: "sucré", icon: "icons/tarte.png")
muffin = Item.create!(name: "Muffin", category: "sucré", icon: "icons/muffin.png")
cheese = Item.create!(name: "Cheese", category: "salé", icon: "icons/cheese.png")
toast = Item.create!(name: "Toast", category: "salé", icon: "icons/toast.png")
burger = Item.create!(name: "Burger", category: "salé", icon: "icons/burger.png")
pizza = Item.create!(name: "Pizza", category: "salé", icon: "icons/pizza.png")
wine = Item.create!(name: "Vin", category: "alcool", icon: "icons/wine.png")
chips = Item.create!(name: "Chips", category: "salé", icon: "icons/chips.png")
frites = Item.create!(name: "Frites", category: "salé", icon: "icons/frenchfries.png")
potato = Item.create!(name: "Patate", category: "salé", icon: "icons/potato.png")
steak = Item.create!(name: "Steak", category: "salé", icon: "icons/steak.png")

agneau = Item.create!(name: "Agneau", category: "sal@", icon: "icons/agneau.png")
sausage = Item.create!(name: "Saucisse", category: "salé", icon: "icons/sausage.png")
grillades = Item.create!(name: "Grillades", category: "salé", icon: "icons/grillades.png")
chicken = Item.create!(name: "Poulet", category: "salé", icon: "icons/chicken.png")
egg = Item.create!(name: "Egg", category: "salé", icon: "icons/egg.png")
moutarde = Item.create!(name: "Moutarde", category: "salé", icon: "icons/moutarde.png")
hotdog = Item.create!(name: "Hot-dog", category: "salé", icon: "icons/hotdog.png")
ketchup = Item.create!(name: "Ketchup", category: "salé", icon: "icons/ketchup.png")
tomato = Item.create!(name: "Tomato", category: "salé", icon: "icons/tomato.png")
champagne = Item.create!(name: "Champagne", category: "alcool", icon: "icons/champagne.png")
beer= Item.create!(name: "Bière", category: "alcool", icon: "icons/beer.png")
vodka = Item.create!(name: "Vodka", category: "alcool", icon: "icons/vodka.png")
gin = Item.create!(name: "Gin", category: "alcool", icon: "icons/gin.png")
tequila = Item.create!(name: "Tequila", category: "alcool", icon: "icons/tequila.png")
popcorn = Item.create!(name: "Pop-corn", category: "salé", icon: "icons/popcorn.png")
croissant = Item.create!(name: "Croissant", category: "sucré", icon: "icons/croissant.png")
bread = Item.create!(name: "Pain", category: "salé", icon: "icons/bread.png")
chocolat = Item.create!(name: "Chocolat", category: "sucré", icon: "icons/chocolat.png")

coffee = Item.create!(name: "Coffee", category: "soft", icon: "icons/coffee.png")
tea = Item.create!(name: "Tea", category: "soft", icon: "icons/tea.png")
milk = Item.create!(name: "Milk", category: "soft", icon: "icons/milk.png")
orange = Item.create!(name: "Orange", category: "sucré", icon: "icons/orange.png")
eau = Item.create!(name: "Eau", category: "soft", icon: "icons/eau.png")
coca = Item.create!(name: "Coca-cola", category: "soft", icon: "icons/coca.png")
orangejuice = Item.create!(name: "Orange", category: "soft", icon: "icons/orangejuice.png")





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


