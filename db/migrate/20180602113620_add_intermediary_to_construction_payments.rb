class AddIntermediaryToConstructionPayments < ActiveRecord::Migration[5.1]
  def change
    add_column :construction_payments, :intermediary, :integer
  end
end
