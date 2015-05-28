# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(:email => 'hi@gmail.com', :password => '12345678')
Staff.create([{no: 1, name: "zhu", phone: "18682262015", description: "creator", gender: 1, point: 1000},{no: 2, name: "chen", phone: "18682262014", description: "designer", gender: 0, point: 1000}])
Gift.create([{sender_no: 1, reciever_no: 2, point: 500, description: "thanks", staff: Staff.first }, {sender_no: 2, reciever_no: 1, point: 400, description: "I don't love you, so sorry", staff: Staff.find_by_no(1)}])
