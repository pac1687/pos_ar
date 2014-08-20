class UpdateSales < ActiveRecord::Migration
  def change
    add_column :sales, :date, :date
    add_column :sales, :total_cost, :float
    remove_column :sales, :purchase_id

  end
end
