class CreateConstructionStocks < ActiveRecord::Migration[5.1]
  def change
    create_table :construction_stocks do |t|
      t.string :item_name
      t.integer :stock_quantity

      t.timestamps
    end
  end
end
