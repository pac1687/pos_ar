class UpdateSalesColumn < ActiveRecord::Migration
  def change
    rename_column :purchases, :sales_id, :sale_id
  end
end
