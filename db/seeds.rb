# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.create!(code: 'VOUCHER',name: 'Cabify Voucher', price: 5.00)
Product.create!(code: 'TSHIRT',name: 'Cabify T-Shirt', price: 20.00)
Product.create!(code: 'MUG',name: 'Cafify Coffee Mug', price: 7.50)
