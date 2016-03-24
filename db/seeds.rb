# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

for i in 1..100
  Product.create(name: 'qua ' + i.to_s,
                price: i*1000, make: i.to_s, description: 'tat ca deu rat ngon', img_link: 'https://upload.wikimedia.org/wikipedia/commons/7/78/Azufaifas_fcm.jpg')
end

User.create(name: 'LifeTime', username: 'LifeTime', email: 'lifetime@life.time', password: '123', password_confirmation: '123', admin: true)
User.create(name: 'LTT', username: 'LTT', email: 'ltt@life.time', password: '123', password_confirmation: '123', admin: false)