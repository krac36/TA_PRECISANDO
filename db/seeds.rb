# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb
puts 'Cleaning db...'

Product.destroy_all
User.destroy_all
# Users

puts 'Creating users...'
User.create!(
  email: 'user1@example.com',
  password: 'password123',
  username: 'user1',
  address: '123 Main St, City, Country',
  fullname: 'John Doe',
  cpf: '12345678900'
)

User.create!(
  email: 'user2@example.com',
  password: 'password456',
  username: 'user2',
  address: '456 Elm St, City, Country',
  fullname: 'Jane Smith',
  cpf: '98765432101'
)

User.create!(
  email: 'user3@example.com',
  password: '1234567',
  username: 'user3',
  address: '152 Ipanema RJ',
  fullname: 'Jane Smith',
  cpf: '98765432100'
)

# Products
puts 'creating products...'
Product.create!(
  description: 'Green lawn chair 1.50m. Waterproof',
  price: 19.99,
  name: 'Lawn chair',
  photos: '',
  category: 'furniture',
  user_id: User.first.id
)

Product.create!(
  description: 'Red and black satin dress, size 38',
  price: 29.99,
  name: 'Red and black Dress',
  photos: '',
  category: 'clothes',
  user_id: User.first.id
)

Product.create!(
  description: 'Gol 1.0 black, 150000km ',
  price: 170,
  name: 'Gol VolksWagen',
  photos: '',
  category: 'cars',
  user_id: User.find_by(username: 'user2').id
)

Product.create!(
  description: 'Blue sofa, 3.20m, Confortable',
  price: 23,
  name: 'Blue sofa',
  photos: '',
  category: 'furniture',
  user_id: User.last.id
)

Product.create!(
  description: 'TANZU 21V Brushless Chain Saw 12 Inch Electric ChainSaw Pruning Wood Power Tool Garden Branch Cutting Machine Lithium Battery',
  price: 50.99,
  name: 'Chainsaw',
  photos: '',
  category: 'tools',
  user_id: User.last.id
)

Product.create!(
  description: 'Orinigal Mona Lisa painting by Leonardo da Vinci',
  price: 4500000,
  name: 'Mona Lisa',
  photos: '',
  category: 'art',
  user_id: User.last.id
)


puts 'done!'
