# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Role.create(name: :admin)
Role.create(name: :client)
Role.create(name: :chef)

admin1 = User.create!(email: 'admin@test.com', password: '123123', user_type: 'Admin', username: 'admin', first_name: 'admin', last_name: 'admin')
admin1.add_role(:admin)
User.create{}

client1 = User.create!(email: 'test@test.com', password: '123123', user_type: 'Client', username: 'test123', first_name: 'Test', last_name: 'User')
client1.add_role(:client)

chef1 = User.create!(email: 'chef@chef.com', password: '123123', user_type: 'Chef', username: 'masterchef', first_name: 'Gordon', last_name: 'Ramsay')
chef1.add_role(:chef)

chef2 = User.create!(email: 'chefy@chefy.com', password: '123123', user_type: 'Chef', username: 'masterchefy', first_name: 'Margarita', last_name: 'Fores')
chef2.add_role(:chef)
# c=Chef.find(2)
# c.region = 'Metro Manila'
# c.city = 'Acacia'

chef3 = User.create!(email: 'chefyy@chefy.com', password: '123123', user_type: 'Chef', username: 'masterchefyy', first_name: 'Margaret', last_name: 'Forest')
chef3.add_role(:chef)
# x=Chef.find(3)
# x.region = 'Metro Manila'
# x.city = 'Amihan'
service = Service.create!(id: 1, chef_id: 1, specialty: 'Asian', service_rate: 1500)

