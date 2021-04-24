# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

PRODUCTS = [
  {'sku': 'abc133', 'description': 'A great gift', 'name': 'The best gift', 'stock': 9},
  {'sku': 'abc111', 'description': 'A decent gift', 'name': 'A so so Gift', 'stock': 6},
  {'sku': 'abc122', 'description': 'A bad gift', 'name': 'The worst gift', 'stock': 5},
]
CUSTOMERS = [
  {'name': 'John Doe', 'email': 'jdoe@email.com'},
  {'name': 'Jane Smith', 'email': 'jsmith@email.com'},
]

PRODUCTS.each do |product|
  Product.find_or_create_by('sku': product[:sku],'description': product[:description],'name': product[:name])
end
CUSTOMERS.each do |customer|
  Customer.find_or_create_by('name': customer[:name],'email': customer[:email])
end
PRODUCTS.each do |product|
  product_record = Product.find_by(name: product[:name])
  if product_record
    product_record.update(stock: product[:stock])
  end

end
