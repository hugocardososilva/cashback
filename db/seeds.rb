# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#create default user admin
FactoryBot.create(:user,password: 'admin123', name: 'admin', email:'admin@admin.com.br' , admin: true)

4.times do
  FactoryBot.create(:offer)
end

4.times do
  FactoryBot.create(:offer, premium: true)
end