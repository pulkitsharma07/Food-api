# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
FoodItem.create(name: "Pizza" , price: 60, quantity_left: 40)
FoodItem.create(name: "Burger" , price: 30, quantity_left: 30)