# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

 # 5.times do
  post = User.new({
                    first_name: Faker::Name.first_name,
                    last_name: Faker::Name.last_name,
                    age: Faker::Number.between(18, 80),
                    email: Faker::Internet.email,
                    password: Faker::Internet.password,
                    message: Faker::Lorem.characters,
                    phone_number: Faker::PhoneNumber.phone_number
                    })
  post.save
   post4 = User.new({
                    first_name: Faker::Name.first_name,
                    last_name: Faker::Name.last_name,
                    age: Faker::Number.between(18, 80),
                    email: Faker::Internet.email,
                    password: Faker::Internet.password,
                    message: Faker::Lorem.characters,
                    phone_number: Faker::PhoneNumber.phone_number
                    })
  post4.save
# end

# 5.times do
  post2 = Product.new({
                    country: Faker::Address.country,
                    city: Faker::Address.city,
                    name: Faker::Name.name,
                    address: "12 rue des Tours Lille",
                    description: Faker::Lorem.sentence,
                    price: Faker::Commerce.price,
                    begin_date: Faker::Date.forward(23),
                    end_date: Faker::Date.backward(14)
                    })
  post2.save
post3 = Product.new({
                    country: Faker::Address.country,
                    city: Faker::Address.city,
                    name: Faker::Name.name,
                    address: "48 rue de Douai Lille",
                    description: Faker::Lorem.sentence,
                    price: Faker::Commerce.price,
                    begin_date: Faker::Date.forward(23),
                    end_date: Faker::Date.backward(14)
                    })
  post3.save
# end
