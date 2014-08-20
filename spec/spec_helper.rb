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

def setup
  @test_product = Product.create({name: "iPad", price: 499.00})
  @test_cashier = Cashier.create({ name: "Yolanda Yoself" })
  @test_customer = Customer.create({ name: "Virtual Bot" })
  @test_sale = Sale.create({customer_id: @test_customer.id, cashier_id: @test_cashier.id, timestamp: "2014-06-02"})
  @test_purchase = Purchase.create({product_id: @test_product.id, quantity: 5, sale_id: @test_sale.id})
  @test_return = Return.create({purchase_id: @test_purchase.id})
end
