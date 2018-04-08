class CreatePayees < ActiveRecord::Migration[5.1]
  def change
    create_table :payees do |t|
      t.references :payee_category, foreign_key: true
      t.string :payee_name
      t.string :payee_account

      t.timestamps
    end
  end
end
