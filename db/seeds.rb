# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.create([{name: 'SuperAdmin', email: 'silverfluxay@163.com', encrypted_password: '$2a$10$py8vxMj43BRzTwqganVgoOMgmmxlC8/t.1/CMUudRaWlncfDU8VtC'}])
