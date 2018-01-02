class CreateStocks < ActiveRecord::Migration[5.1]
  def change
    create_table :stocks do |t|
      t.references :stock_item, foreign_key: true
      t.date :filling_date
      t.integer :quantity

      t.timestamps
    end
  end
end
