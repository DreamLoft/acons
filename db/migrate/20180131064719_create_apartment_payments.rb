class CreateApartmentPayments < ActiveRecord::Migration[5.1]
  def change
    create_table :apartment_payments do |t|
      t.references :office_deal, foreign_key: true
      t.integer :amount_paid
      t.date :payment_date

      t.timestamps
    end
  end
end
