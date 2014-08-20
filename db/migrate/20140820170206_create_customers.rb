class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.column :name, :string
    end
  end
end
