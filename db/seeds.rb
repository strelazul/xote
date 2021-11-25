# Xote e-commerce
# Paloma Brandao

require "csv"
require "faker"
require "json"
require "net/http"

Stock.destroy_all
Product.destroy_all
Category.destroy_all
City.destroy_all
Province.destroy_all

product_file = Rails.root.join("db/mandyoka.csv")
product_data = File.read(product_file)

products = CSV.parse(product_data, headers: true)

products.each do |product|
  category = Category.find_or_create_by(name: product["category"])
  new_product = category.products.build(name:        product["name"],
                                        description: product["description"],
                                        price:       product["price"],
                                        alcohol:     product["alcohol"])
  new_product.save
  stock = new_product.stocks.build(quantity:     product["stock_quantiy"],
                                   durable_life: product["durable_life"],
                                   made_on:      Faker::Date.backward(days: 3))
  stock.save
end

# Cities and province information got from https://simplemaps.com/data/canada-cities
cities_file = Rails.root.join("db/canadacities.csv")
cities_data = File.read(cities_file)

tax_uri = URI("https://api.salestaxapi.ca/v2/province/all")
tax_response = Net::HTTP.get(tax_uri)
tax_json = JSON.parse(tax_response)

cities = CSV.parse(cities_data, headers: true)

cities.each do |city|
  province_key = city["province_id"].downcase
  province = Province.find_or_create_by(name:         city["province_name"],
                                        abbreviation: city["province_id"],
                                        gst:          tax_json[province_key]["gst"],
                                        pst:          tax_json[province_key]["pst"],
                                        hst:          tax_json[province_key]["hst"])
  new_city = province.cities.build(name: city["city"])
  new_city.save
end
