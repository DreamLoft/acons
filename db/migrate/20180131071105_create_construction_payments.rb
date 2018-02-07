class CreateConstructionPayments < ActiveRecord::Migration[5.1]
  def change
    create_table :construction_payments do |t|
      t.string :payee_name
      t.string :payee_account
      t.integer :amount_paid
      t.date :payment_date
      t.string :payment_mode
      t.string :payemnt_category
      t.references :project, foreign_key: true
      t.text :payment_info

      t.timestamps
    end
  end
end
