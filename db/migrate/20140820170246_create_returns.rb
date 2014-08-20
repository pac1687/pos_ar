class CreateReturns < ActiveRecord::Migration
  def change
    create_table :returns do |t|
      t.column :product_id, :integer
      t.column :customer_id, :integer
      t.column :cashier_id, :integer
      t.column :timestamp, :timestamp
    end
  end
end
