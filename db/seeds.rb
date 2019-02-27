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
flo = User.create!(nickname: 'Flo', email: 'flo@gmail.com', password: 'azerty')
susan = User.create!(nickname: 'Susan', email: 'sus@gmail.com', password: 'azerty')



puts 'Creating event...'

event_1 = Event.create!(user_id: sam.id, title: "raclette", description: "ce sera bien", address: "16 villa gaudelet", date: Date.today)
event_2 = Event.create!(user_id: remi.id, title: "couscous", description: "pétage de bid", address: "chez ma maman", date: Date.today)

puts 'Creating guests...'
g1 = Guest.create!(user_id: remi.id, event_id: event_1.id, is_coming: true)
g2 = Guest.create!(user_id: flo.id, event_id: event_1.id, is_coming: true)
g3 = Guest.create!(user_id: susan.id, event_id: event_1.id, is_coming: true)
g4 = Guest.create!(user_id: sam.id, event_id: event_1.id, is_coming: false)

puts 'Creating items...'
beer = Item.create!(name: "bière", category: "alcool", icon: "icons/beer.png")
bone = Item.create!(name: "rôti", category: "salé", icon: "icons/bone.png")
bread = Item.create!(name: "pain", category: "salé", icon: "icons/bread.png")
brochettes = Item.create!(name: "brochettes", category: "salé", icon: "icons/brochettes.png")
burger = Item.create!(name: "burger", category: "salé", icon: "icons/burger.png")
champagne = Item.create!(name: "champagne", category: "alcool", icon: "icons/champagne.png")
cheese = Item.create!(name: "fromage", category: "salé", icon: "icons/cheese.png")
chicken = Item.create!(name: "poulet", category: "salé", icon: "icons/chicken.png")
coke = Item.create!(name: "coca-cola", category: "soft", icon: "icons/coke.png")
croissant = Item.create!(name: "croissant", category: "sucré", icon: "icons/croissant.png")
frenchfries = Item.create!(name: "frites", category: "salé", icon: "icons/frenchfries.png")
gin = Item.create!(name: "gin", category: "alcool", icon: "icons/gin.png")
hotdog = Item.create!(name: "hotdog", category: "salé", icon: "icons/hotdog.png")
ketchup = Item.create!(name: "ketchup", category: "salé", icon: "icons/ketchup.png")
milk = Item.create!(name: "lait", category: "soft", icon: "icons/milk.png")
orangejuice = Item.create!(name: "jus d'orange", category: "soft", icon: "icons/orangejuice.png")
pizza = Item.create!(name: "pizza", category: "salé", icon: "icons/pizza.png")
popcorn = Item.create!(name: "popcorn", category: "sucré", icon: "icons/popcorn.png")
potato = Item.create!(name: "pomme de terre", category: "salé", icon: "icons/potato.png")
potatochip = Item.create!(name: "chips", category: "salé", icon: "icons/potatochip.png")
rhum = Item.create!(name: "rhum", category: "alcool", icon: "icons/rhum.png")
sausage = Item.create!(name: "saucisse", category: "salé", icon: "icons/sausage.png")
steak = Item.create!(name: "steak", category: "salé", icon: "icons/steak.png")
tequila = Item.create!(name: "tequila", category: "alcool", icon: "icons/tequila.png")
tomato = Item.create!(name: "tomate", category: "salé", icon: "icons.tomato.png")
vodka = Item.create!(name: "vodka", category: "alcool", icon: "icons/vodka.png")
wine = Item.create!(name: "wine", category: "alcool", icon: "icons/wine.png")



puts 'Creating whishlist...'

ingredient_1 = Whishlist.create!(item_id: Item.first.id, event_id: event_1.id, quantity: 4)
ingredient_2 = Whishlist.create!(item_id: Item.second.id, event_id: event_1.id, quantity: 2)
ingredient_3 = Whishlist.create!(item_id: Item.third.id, event_id: event_1.id, quantity: 5)
ingredient_4 = Whishlist.create!(item_id: Item.fourth.id, event_id: event_1.id, quantity: 3)

puts 'Creating basket...'
my_basket1 = Basket.create!(whishlist_id: Whishlist.first.id, user_id: remi.id, quantity: 2)
my_basket2 = Basket.create!(whishlist_id: Whishlist.second.id, user_id: flo.id, quantity: 2)
my_basket3 = Basket.create!(whishlist_id: Whishlist.third.id, user_id: sam.id, quantity: 1)
my_basket4 = Basket.create!(whishlist_id: Whishlist.fourth.id, user_id: susan.id, quantity: 2)



puts 'Finished!'


