class CreatePayeeCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :payee_categories do |t|
      t.string :category_name
      t.string :category_description

      t.timestamps
    end
  end
end
