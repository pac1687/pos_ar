class CreateSales < ActiveRecord::Migration
  def change
    remove_column :purchases, :customer_id
    remove_column :purchases, :cashier_id
    remove_column :purchases, :timestamp
    add_column :purchases, :quantity, :integer
    add_column :purchases, :sales_id, :integer

    create_table :sales do |t|
      t.column :purchase_id, :integer
      t.column :customer_id, :integer
      t.column :cashier_id, :integer
      t.column :timestamp, :timestamp
    end
  end
end
