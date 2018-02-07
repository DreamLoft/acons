class CreateConstructionStockFillings < ActiveRecord::Migration[5.1]
  def change
    create_table :construction_stock_fillings do |t|
      t.references :construction_stock, foreign_key: true
      t.integer :quantity
      t.date :filling_date
      t.string :accepted_by
      t.string :filling_location

      t.timestamps
    end
  end
end
