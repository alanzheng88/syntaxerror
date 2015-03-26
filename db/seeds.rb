# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.create!(name: 'QuickWatch', price: 299, brand_id: 1, category_id: 1, created_at: Time.now, updated_at: Time.now)
Product.create!(name: 'Precision-Book X Series', price: 899, brand_id: 1, category_id: 2, created_at: Time.now, updated_at: Time.now)
Product.create!(name: 'PrecisionCell P series', price: 499, brand_id: 1, category_id: 3, created_at: Time.now, updated_at: Time.now)
Product.create!(name: 'PrecisionCell adaptor', price: 26.99, brand_id: 1, category_id: 4, created_at: Time.now, updated_at: Time.now)
Product.create!(name: 'Smartgear', price: 349, brand_id: 2, category_id: 1, created_at: Time.now, updated_at: Time.now)
Product.create!(name: 'Smartbook', price: 879.99, brand_id: 2, category_id: 2, created_at: Time.now, updated_at: Time.now)
Product.create!(name: 'Smartcell', price: 699, brand_id: 2, category_id: 3, created_at: Time.now, updated_at: Time.now)
Product.create!(name: 'Smartbook laptop protector', price: 69.99, brand_id: 2, category_id: 4, created_at: Time.now, updated_at: Time.now)
Product.create!(name: 'Krusche Time (T-series)', price: 399, brand_id: 3, category_id: 1, created_at: Time.now, updated_at: Time.now)
Product.create!(name: 'Krusche Mint II', price: 799, brand_id: 3, category_id: 2, created_at: Time.now, updated_at: Time.now)
Product.create!(name: 'Krusche Quick S3', price: 699, brand_id: 3, category_id: 3, created_at: Time.now, updated_at: Time.now)
Product.create!(name: 'Krusche USB Charger', price: 14.49, brand_id: 3, category_id: 4, created_at: Time.now, updated_at: Time.now)

brands = ['Xiaowei Inc.', 'Smartcell Tech', 'Krusche Crop']
brands.each do |brand|
	Brand.create!(name: brand, created_at: Time.now, updated_at: Time.now)
end

categories = ['Wearable Tech','Computers & laptops','Mobile Devices','MISC']
categories.each do |category|
	Category.create!(name: category, created_at: Time.now, updated_at: Time.now)
end


Role.create!(role: 'Site Administrator', created_at: Time.now, updated_at: Time.now)
Role.create!(role: 'Vendor Administrator', created_at: Time.now, updated_at: Time.now)
Role.create!(role: 'Vendor Manager', created_at: Time.now, updated_at: Time.now)
Role.create!(role: 'User', created_at: Time.now, updated_at: Time.now)

Vendor.create!(name: 'SmartBuy', locationkey: 1, productkey: 1, created_at: Time.now, updated_at: Time.now)
Vendor.create!(name: 'KCIX', locationkey: 2, productkey: 2, created_at: Time.now, updated_at: Time.now)
Vendor.create!(name: 'Present Shop', locationkey: 3, productkey: 3, created_at: Time.now, updated_at: Time.now)
Vendor.create!(name: 'The Post', locationkey: 4, productkey: 4, created_at: Time.now, updated_at: Time.now)
Vendor.create!(name: 'ShopComm', locationkey: 5, productkey: 5, created_at: Time.now, updated_at: Time.now)

User.create!(username: 'wendylee', firstname: 'Wendy', lastname: '', password: 'Password123', email: 'asdf1@email.com', role_id: 1, vendor_id: 5, created_at: Time.now, updated_at: Time.now)
User.create!(username: 'linwei69', firstname: 'Lin', lastname: 'Wei', password: 'Password123', email: 'asdf2@email.com', role_id: 2, vendor_id: 1, created_at: Time.now, updated_at: Time.now)
User.create!(username: 'david', firstname: 'David ', lastname: 'McDonald', password: 'Password123', email: 'asdf3@email.com', role_id: 2, vendor_id: 2, created_at: Time.now, updated_at: Time.now)
User.create!(username: 'victor22', firstname: 'Victor', lastname: 'Schmatter', password: 'Password123', email: 'asdf4@email.com', role_id: 2, vendor_id: 3, created_at: Time.now, updated_at: Time.now)
User.create!(username: 'janice', firstname: 'Janice', lastname: 'Wong', password: 'Password123', email: 'asdf5@email.com', role_id: 2, vendor_id: 4, created_at: Time.now, updated_at: Time.now)
User.create!(username: 'andy9', firstname: 'Andy ', lastname: 'Lee', password: 'Password123', email: 'asdf6@email.com', role_id: 3, vendor_id: 4, created_at: Time.now, updated_at: Time.now)
User.create!(username: 'wilsonchan', firstname: 'Wilson', lastname: 'Chan', password: 'Password123', email: 'asdf7@email.com', role_id: 3, vendor_id: 4, created_at: Time.now, updated_at: Time.now)
User.create!(username: 'devin123', firstname: 'Devin ', lastname: 'Sim', password: 'Password123', email: 'asdf8@email.com', role_id: 4, created_at: Time.now, updated_at: Time.now)
User.create!(username: 'alanz', firstname: 'Alan ', lastname: 'Zheng', password: 'Password2', email: 'alanz@sfu.ca', role_id: 1, vendor_id: 5, created_at: Time.now, updated_at: Time.now)

# Add products to vendors
products = ["QuickWatch", "Precision-Book X Series", 
	"PrecisionCell P series", "PrecisionCell adaptor",
	"Smartgear", "Smartbook", "Smartcell", "Smartbook laptop protector",
	"Krusche Time (T-series)", "Krusche Mint II", "Krusche Quick S3",
	"Krusche USB Charger"]
vendorToProducts = {
	"SmartBuy" => [products[4], products[5], products[8], products[0], products[10]],
	"KCIX" => [products[0], products[1], products[9], products[10], products[6]],
	"Present Shop" => products,
	"The Post" => [products[0], products[3], products[6], products[10], products[4]]
}

# Assume each vendor has an array of products
vendorToProducts.each do |vendor, productList|
	productList.each do |product|
		randomSumAmount = rand(95) + 5
		productToAdd = Product.where(name: product).first.name
		sale = Sale.create(product: productToAdd, sumtotal: randomSumAmount)
		v = Vendor.where(name: vendor).first
		v.sales << sale
	end
end





