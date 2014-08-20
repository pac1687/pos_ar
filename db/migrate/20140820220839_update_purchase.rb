class UpdatePurchase < ActiveRecord::Migration
  def change
    add_column :purchases, :purchase_total, :float
  end
end
