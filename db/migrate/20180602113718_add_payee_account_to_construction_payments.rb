class AddPayeeAccountToConstructionPayments < ActiveRecord::Migration[5.1]
  def change
    add_column :construction_payments, :payee_account, :string
    @cps = ConstructionPayment.where(intermediary: nil)

    @cps.each do |cp|
      cp.intermediary = cp.payee_id
      cp.save!
    end
  end
end
