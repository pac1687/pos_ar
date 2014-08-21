class UpdatePurchasez < ActiveRecord::Migration
  def change
    add_column :purchases, :returned, :boolean
  end
end
