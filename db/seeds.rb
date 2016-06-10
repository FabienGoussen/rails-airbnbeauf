# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

 # 5.times do

 Product.create!({
   name: "Le cochon sur roues",
   description: "JV T NIKE T MOR ENKULE",
   address: "58 avenue du Peuple Belge, Lille",
   price: 27
 })

 Product.create!({
   name: "La grosse bertha",
   description: "JV T NIKE T MOR ENKULE",
   address: "58 avenue du Peuple Belge, Lille",
   price: 35
 })

 Product.create!({
   name: "La culotte sur pattes",
   description: "JV T NIKE T MOR ENKULE",
   address: "58 avenue du Peuple Belge, Lille",
   price: 27
 })

 Product.create!({
   name: "Tout est bon dans le jambon",
   description: "JV T NIKE T MOR ENKULE",
   address: "58 avenue du Peuple Belge, Lille",
   price: 27
 })

 Product.create!({
   name: "Casquette gourmette et ça part",
   description: "JV T NIKE T MOR ENKULE",
   address: "58 avenue du Peuple Belge, Lille",
   price: 27
 })
