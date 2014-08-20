require 'active_record'
require 'pry'

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

database_configuration = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configuration["development"]
ActiveRecord::Base.establish_connection(development_configuration)

@current_cashier

def whitespace
  puts "\n"
end

def header
  system 'clear'
  puts "Point of Sales"
  puts "=" * 60
  whitespace
end

def main_menu
  header
  puts "Welcome the Point of Sales system"
  puts "Enter 1 if you are a store manager"
  puts "Enter 2 if you are a cashier"
  puts "Enter 3 if you are a customer"
  puts "Enter x to exit the system"

  case gets.chomp
  when '1'
    manager_menu
  when '2'
    cashier_menu
  when '3'
    customer_menu
  when 'x'
    exit
  else
    main_menu
  end
end

def manager_menu
  header
  puts "Manager Menu"
  whitespace

  puts "Enter 1 to add a new product"
  puts "Enter 2 to create a new cashier"
  puts "Enter 3 to view total sales"
  puts "Enter 4 to view cashier sales"
  puts "Enter 5 view most popular products"
  puts "Enter 6 view most returned products"
  puts "Enter x to exit the system"

  case gets.chomp
  when '1'
    add_product
  when '2'
    new_cashier
  when '3'
    total_sales
  when '4'
    cashier_sales
  when '5'
    popular_products
  when '6'
    returned_products
  when 'x'
    exit
  else
    main_menu
  end
end

def cashier_menu
  header
  puts "Cashier Menu"
  whitespace

  puts "Please login or press x to return to the main menu:"
  # binding.pry
  user_input = gets.chomp
  @current_cashier = Cashier.find_by_name(user_input)
  if user_input == 'x'
    main_menu
  elsif @current_cashier == nil
   puts "Invalid login."
   sleep(1.5)
   cashier_menu
  end

  puts "Enter 1 start new sale"
  puts "Enter x to exit the system"
  whitespace

  case gets.chomp
  when '1'
    sale_menu
  when 'x'
    exit
  else
    main_menu
  end
end

def sale_menu
  header
  puts "Sale Menu"
  whitespace
  puts "Please enter the customer's name"
  current_customer = Customer.find_or_create_by(name: gets.chomp)
  new_sale = Sale.create({customer_id: current_customer.id, cashier_id: @current_cashier.id})
  list_products
  user_input = nil
  loop do
    puts "Select a product. Type done to complete and calculate total."
    user_input = gets.chomp
    if user_input == 'done'
      sleep(1.5)
      break
    else
      selected_product = Product.find(user_input)
      puts "Quantity?"
      selected_quantity = gets.chomp.to_i
      total = selected_product.price * selected_quantity
      new_purchase = Purchase.create({product_id: selected_product.id, quantity: selected_quantity, sale_id: new_sale.id, purchase_total: total})
      puts "Total: $#{total.to_f}"
    end
  end
  total = Purchase.where(sale_id: new_sale.id).sum("purchase_total")
  updated_sale = Sale.update(new_sale.id, total_cost: total)
  sale_total = updated_sale.total_cost.to_f
  puts "Sale Total: $#{sale_total}"
  sleep(2)
  cashier_menu
  # puts
end

def customer_menu

end

def add_product
  header
  puts "Add Product Menu"
  whitespace

  puts "Enter in the name of the product you'd like to add:"
  name = gets.chomp
  puts "Enter the price of the product:"
  price = gets.chomp
  new_product = Product.create({name: name, price: price})
  puts "#{new_product.name} has been added!"
  sleep(1.5)
  manager_menu
end

def new_cashier
  header
  puts "Add Cashier Menu"
  whitespace

  puts "Enter in the name of the cashier you'd like to add:"
  name = gets.chomp
  new_cashier = Cashier.create({name: name})
  puts "#{new_cashier.name} has been added!"
  sleep(1.5)
  manager_menu
end

def list_products
  header
  puts "All Products"
  Product.all.each do |product|
    puts "#{product.id}. #{product.name} | $#{product.price.to_f}"
  end
end

def total_sales

end

def cashier_sales

end

def popular_products

end

def returned_products

end

main_menu
