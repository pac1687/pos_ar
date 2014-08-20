class UpdateAllTables < ActiveRecord::Migration
  def change
    change_table :products do |t|
      t.timestamps
    end

    change_table :cashiers do |t|
      t.timestamps
    end

    change_table :customers do |t|
      t.timestamps
    end

    change_table :purchases do |t|
      t.timestamps
    end

    change_table :returns do |t|
      t.timestamps
    end

    change_table :sales do |t|
      t.timestamps
    end

    remove_column :sales, :timestamp
    remove_column :sales, :date
    remove_column :returns, :timestamp

  end
end
