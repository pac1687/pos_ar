class UpdateReturns < ActiveRecord::Migration
  def change
    remove_column :returns, :product_id
    remove_column :returns, :customer_id
    remove_column :returns, :cashier_id
    remove_column :returns, :timestamp
    add_column :returns, :purchase_id, :integer
    add_column :returns, :timestamp, :timestamp
  end
end
