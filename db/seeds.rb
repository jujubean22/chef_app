# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Role.create(name: :admin)
# Role.create(name: :client)
# Role.create(name: :chef)

admin1 = User.create!(email: 'admin@test.com', password: '123123', user_type: 'Admin', username: 'admin', first_name: 'admin', last_name: 'admin')
# admin1.add_role(:admin)

client1 = User.create!(email: 'test@test.com', password: '123123', user_type: 'Client', username: 'test123', first_name: 'Test', last_name: 'User')
# client1.add_role(:client)

chef1 = User.create!(email: 'chef@chef.com', password: '123123', user_type: 'Chef', username: 'masterchef', first_name: 'Gordon', last_name: 'Ramsay', region: 'Metro Manila', city:'Acacia')
# chef1.add_role(:chef)