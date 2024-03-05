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
require "open-uri"

puts 'Cleaning db...'

Rental.destroy_all
Product.destroy_all
User.destroy_all
# Users

puts 'Creating users...'

file = URI.open("https://who13.com/wp-content/uploads/sites/19/2023/09/Norman-Reedus-e1693573153890.jpg")
john = User.new(
  email: 'user1@example.com',
  password: 'password123',
  username: 'user1',
  address: '123 Main St, City, Country',
  fullname: 'John Doe',
  cpf: '12345678900'
)
john.photo.attach(io: file, filename: "john.png", content_type: "image/png")
john.save

file = URI.open("https://static1.moviewebimages.com/wordpress/wp-content/uploads/article/Yjt1Z0ksVnYNSikFoRs80dggaPAeoW.jpg")
jane = User.new(
  email: 'user2@example.com',
  password: 'password456',
  username: 'user2',
  address: '456 Elm St, City, Country',
  fullname: 'Jane Smith',
  cpf: '98765432101'
)
jane.photo.attach(io: file, filename: "jane.png", content_type: "image/png")
jane.save

file = URI.open("https://www.looper.com/img/gallery/we-might-finally-know-what-happens-to-jadis-on-the-walking-dead-world-beyond/l-intro-1632411248.jpg")
ember = User.new(
  email: 'user3@example.com',
  password: '1234567',
  username: 'user3',
  address: '152 Ipanema RJ',
  fullname: 'Ember Karl',
  cpf: '98765432100'
)
ember.photo.attach(io: file, filename: "ember.png", content_type: "image/png")
ember.save

# Products
puts 'creating products...'

file = URI.open("https://i.pinimg.com/736x/36/8d/9e/368d9ee203560c78584c3dccac708c5e.jpg")
product =Product.new(
  description: 'Green lawn chair 1.50m. Waterproof',
  price: 19.99,
  name: 'Lawn chair',
  category: 'furniture',
  user_id: User.first.id
)
product.photos.attach(io: file, filename: "chair.png", content_type: "image/png")
product.save

file = URI.open("https://img.veaul.com/catalog/product/9/1/911218_1.jpg")
product = Product.new(
  description: 'Red and black satin dress, size 38',
  price: 29.99,
  name: 'Red and black Dress',
  category: 'clothes',
  user_id: User.first.id
)
product.photos.attach(io: file, filename: "dress.png", content_type: "image/png")
product.save


file = URI.open("https://cdn.shopcar.com.br/stored/veiculos/1657743894_93780.jpg")
file2 = URI.open("https://seminovosrj.com.br/fotos/1262/1087510/11.jpg")
product = Product.new(
  description: 'Gol 1.0 black, 150000km ',
  price: 170,
  name: 'Gol VolksWagen',
  category: 'cars',
  user_id: User.find_by(username: 'user2').id
)
product.photos.attach(io: file, filename: "car.png", content_type: "image/png")
product.photos.attach(io: file2, filename: "car2.png", content_type: "image/png")
product.save

file = URI.open("https://assets.plush.com.au/media/catalog/product/cache/6cc0596e45ce2f5b15d1cad8a3f995a2/a/d/adelphi_navy_vogar_5d0133-qk_1.jpg")
product = Product.new(
  description: 'Blue sofa, 3.20m, Confortable',
  price: 23,
  name: 'Blue sofa',
  category: 'furniture',
  user_id: User.last.id
)
product.photos.attach(io: file, filename: "sofa.png", content_type: "image/png")
product.save

file = URI.open("https://ae01.alicdn.com/kf/Sa7d11807908d46c895d280f655d02fbdR/TANZU-21V-Brushless-Chain-Saw-12-Inch-Electric-ChainSaw-Pruning-Wood-Power-Tool-Garden-Branch-Cutting.jpg")
chainsaw = Product.new(
  description: 'TANZU 21V Brushless Chain Saw 12 Inch Electric ChainSaw Pruning Wood Power Tool Garden Branch Cutting Machine Lithium Battery',
  price: 50.99,
  name: 'Chainsaw',
  category: 'tools',
  user_id: User.last.id
)
chainsaw.photos.attach(io: file, filename: "chainsaw.png", content_type: "image/png")
chainsaw.save

file = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Mona_Lisa%2C_by_Leonardo_da_Vinci%2C_from_C2RMF_retouched.jpg/640px-Mona_Lisa%2C_by_Leonardo_da_Vinci%2C_from_C2RMF_retouched.jpg")
file2 = URI.open("https://s.rfi.fr/media/display/020d38cc-10b8-11ea-99ec-005056bf7c53/w:1280/p:1x1/000_Par2712571_0.jpg")
product = Product.new(
  description: 'Orinigal Mona Lisa painting by Leonardo da Vinci',
  price: 4500000,
  name: 'Mona Lisa',
  category: 'art',
  user_id: User.last.id
)
product.photos.attach(io: file, filename: "painting.png", content_type: "image/png")
product.photos.attach(io: file2, filename: "frame.png", content_type: "image/png")
product.save

rental = Rental.new(
    product_id: chainsaw.id,
    rentee_id: jane.id,
    start_date: Date.today,
    end_date: Date.today + 5,
    confirmed: true
)
rental.save


puts 'done!'
