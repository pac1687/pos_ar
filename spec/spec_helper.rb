require "active_record"
require "./lib/cashier"
require "./lib/customer"
require "./lib/product"
require "./lib/purchase"
require "./lib/return"
require "./lib/sale"
require "shoulda-matchers"
require "pry"

database_configuration = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configuration["development"]
ActiveRecord::Base.establish_connection(development_configuration)

RSpec.configure do |config|
  config.before(:each) do
    Cashier.all.each { |cashier| cashier.destroy }
    Customer.all.each { |customer| customer.destroy }
    Product.all.each { |product| product.destroy }
    Purchase.all.each { |purchase| purchase.destroy }
    Return.all.each { |r| r.destroy }
    Sale.all.each { |sale| sale.destroy }
  end
end
