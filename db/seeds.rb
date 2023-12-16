# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
  email: "11111@gmail.com",
  password: "111111"
)

# Customer.create!(
#   email:"aaa@gmail.com",
#   last_name:"aa",
#   first_name:"aa",
#   last_name_kana:"aa",
#   first_name_kana:"aa",
#   postal_code:"000000",
#   address:"aa",
#   telephone_number:"00000000000",
#   is_active:false,
#   password:"aaaaaa"
#   )