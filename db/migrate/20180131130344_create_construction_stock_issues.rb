class CreateConstructionStockIssues < ActiveRecord::Migration[5.1]
  def change
    create_table :construction_stock_issues do |t|
      t.references :construction_stock, foreign_key: true
      t.integer :quanity
      t.date :issue_date
      t.string :issued_to

      t.timestamps
    end
  end
end
