class AddDesriptionToApartmentPayment < ActiveRecord::Migration[5.1]
  def change
    add_column :apartment_payments, :description, :text
  end
end
