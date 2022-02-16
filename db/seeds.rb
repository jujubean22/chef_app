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
#admin1.add_role(:admin)

client1 = User.create!(email: 'test@test.com', password: '123123', user_type: 'Client', username: 'test123', first_name: 'Test', last_name: 'User')
#client1.add_role(:client)

chef1 = User.create!(email: 'chef@chef.com', password: '123123', user_type: 'Chef', username: 'masterchef', first_name: 'Gordon', last_name: 'Ramsay')
#chef1.add_role(:chef)
# Chef.create!(user_id: 3, region: 'Ilocos', city: 'Abanon', contact_number: '09123423456', bio: 'I am an accomplished chef with over 20 years of working experience in 5-star hotels, and headed a culinary team as Executive Chef during the Papal Visit in the Philippines accommodating the Cardinal delegates from the Vatican, January of 2015. Graduated with a Master’s Degree in Tourism and Hospitality Management while working as part-time culinary instructor and culinary consultant opening restaurants and hotel operations .')

chef2 = User.create!(email: 'chefy@chefy.com', password: '123123', user_type: 'Chef', username: 'masterchefy', first_name: 'Margarita', last_name: 'Fores')
#chef2.add_role(:chef)
# Chef.create!(user_id: 4, region: 'Metro Manila', city: 'Amihan', contact_number: '09123423456', bio: 'A high energy, a leader, a trainer and a creative chef with solid 22 years of culinary experience. Strives for top culinary performance and high quality food production using finest gourmet ingredients. Expertise in many cooking styles, techniques and seasoning dishes. Talent in preparing special cuisines from around the world.')

chef3 = User.create!(email: 'chefyy@chefy.com', password: '123123', user_type: 'Chef', username: 'masterchefyy', first_name: 'Margaret', last_name: 'Forest')
#chef3.add_role(:chef)
# Chef.create!(user_id: 5, region: 'Ilocos', city: 'Abanon', contact_number: '09123423456', bio: 'Modern European cuisine with inspiration from all walks of life. Training and experience from high profile chefs including Joel robuchon, Jason atherton and Ryan clift. Able to also include a theatrical display together with dishes and a story to tell throughout the menu which if needed could be designed to required specifications')
