class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.references :booking, foreign_key: true
      t.decimal :amount_paid
      t.string :payment_method

      t.timestamps
    end
  end
end
