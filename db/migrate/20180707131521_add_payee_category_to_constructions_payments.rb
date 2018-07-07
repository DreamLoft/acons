class AddPayeeCategoryToConstructionsPayments < ActiveRecord::Migration[5.1]
  def change
    add_reference :construction_payments, :payee_category, foreign_key: true
  end
end
