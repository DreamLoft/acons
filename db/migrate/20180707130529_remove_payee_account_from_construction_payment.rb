class RemovePayeeAccountFromConstructionPayment < ActiveRecord::Migration[5.1]
  def change
  	remove_column :construction_payments, :payee_account, :string
  	remove_column :construction_payments, :payemnt_category, :string
  end
end
