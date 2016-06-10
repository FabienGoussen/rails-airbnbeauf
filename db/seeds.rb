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
  description: "cavane rose belle et cruelle",
  address: "58 avenue du Peuple Belge, Lille",
  price: 27
})

Product.create!({
  name: "La grosse bertha",
  description: "karavane rose en peau bete",
  address: "rue Dunkerque, 62220 Carvin",
  price: 35
})

Product.create!({
  name: "La Leo de Luxe",
  description: "jolie charmante et tte petite",
  address: "29 rue de dunkerque 75010 paris",
  price: 27
})

