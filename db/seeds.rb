# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.create(name: 'QuickWatch', price: 299, brand: 'Xiaowei Inc.', category: 'Wearable Tech', created_at: Time.now, updated_at: Time.now)
Product.create(name: 'Precision-Book X Series', price: 899, brand: 'Xiaowei Inc.', category: 'Computers & laptops', created_at: Time.now, updated_at: Time.now)
Product.create(name: 'PrecisionCell P series', price: 499, brand: 'Xiaowei Inc.', category: 'Mobile Devices', created_at: Time.now, updated_at: Time.now)
Product.create(name: 'PrecisionCell adaptor', price: 26.99, brand: 'Xiaowei Inc.', category: 'MISC', created_at: Time.now, updated_at: Time.now)
Product.create(name: 'Smartgear', price: 349, brand: 'Smartcell Tech', category: 'Wearable Tech', created_at: Time.now, updated_at: Time.now)
Product.create(name: 'Smartbook', price: 879.99, brand: 'Smartcell Tech', category: 'Computers & laptops', created_at: Time.now, updated_at: Time.now)
Product.create(name: 'Smartcell', price: 699, brand: 'Smartcell Tech', category: 'Mobile Devices', created_at: Time.now, updated_at: Time.now)
Product.create(name: 'Smartbook laptop protector', price: 69.99, brand: 'Smartcell Tech', category: 'MISC', created_at: Time.now, updated_at: Time.now)
Product.create(name: 'Krusche Time (T-series)', price: 399, brand: 'Krusche Corp', category: 'Wearable Tech', created_at: Time.now, updated_at: Time.now)
Product.create(name: 'Krusche Mint II', price: 799, brand: 'Krusche Corp', category: 'Computers & laptops', created_at: Time.now, updated_at: Time.now)
Product.create(name: 'Krusche Quick S3', price: 699, brand: 'Krusche Corp', category: 'Mobile Devices', created_at: Time.now, updated_at: Time.now)
Product.create(name: 'Krusche USB Charger', price: 14.49, brand: 'Krusche Corp', category: 'MISC', created_at: Time.now, updated_at: Time.now)

Role.create(role: 'Site Administrator', created_at: Time.now, updated_at: Time.now)
Role.create(role: 'Vendor Adminstrator', created_at: Time.now, updated_at: Time.now)
Role.create(role: 'Vendor Manager', created_at: Time.now, updated_at: Time.now)
Role.create(role: 'User', created_at: Time.now, updated_at: Time.now)

Vendor.create(vendor: 'SmartBuy', locationkey: 1, created_at: Time.now, updated_at: Time.now)
Vendor.create(vendor: 'KCIX', locationkey: 2, created_at: Time.now, updated_at: Time.now)
Vendor.create(vendor: 'Present Shop', locationkey: 3, created_at: Time.now, updated_at: Time.now)
Vendor.create(vendor: 'The Post', locationkey: 4, created_at: Time.now, updated_at: Time.now)
Vendor.create(vendor: 'ShopComm', locationkey: 5, created_at: Time.now, updated_at: Time.now)

User.create(username: 'username1', firstname: 'Wendy', lastname: '', password: 'Password1', email: 'asdf1@email.com', rolekey: 1, userlistkey: 1, created_at: Time.now, updated_at: Time.now)
User.create(username: 'username2', firstname: 'Lin', lastname: 'Wei', password: 'Password2', email: 'asdf2@email.com', rolekey: 2, userlistkey: 2, created_at: Time.now, updated_at: Time.now)
User.create(username: 'username3', firstname: 'David ', lastname: 'McDonald', password: 'Password3', email: 'asdf3@email.com', rolekey: 3, userlistkey: 3, created_at: Time.now, updated_at: Time.now)
User.create(username: 'username4', firstname: 'Victor', lastname: 'Schmatter', password: 'Password4', email: 'asdf4@email.com', rolekey: 4, userlistkey: 4, created_at: Time.now, updated_at: Time.now)
User.create(username: 'username5', firstname: 'Janice', lastname: 'Wong', password: 'Password5', email: 'asdf5@email.com', rolekey: 5, userlistkey: 5, created_at: Time.now, updated_at: Time.now)
User.create(username: 'username6', firstname: 'Andy ', lastname: 'Lee', password: 'Password6', email: 'asdf6@email.com', rolekey: 6, userlistkey: 6, created_at: Time.now, updated_at: Time.now)
User.create(username: 'username7', firstname: 'Wilson', lastname: 'Chan', password: 'Password7', email: 'asdf7@email.com', rolekey: 7, userlistkey: 7, created_at: Time.now, updated_at: Time.now)
User.create(username: 'username8', firstname: 'Devin ', lastname: 'Sim', password: 'Password8', email: 'asdf8@email.com', rolekey: 8, userlistkey: 8, created_at: Time.now, updated_at: Time.now)