class AddPayeeToConstructionPayments < ActiveRecord::Migration[5.1]
  def change
    add_reference :construction_payments, :payee, foreign_key: true
  end
end
