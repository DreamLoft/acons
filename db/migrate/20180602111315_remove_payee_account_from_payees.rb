class RemovePayeeAccountFromPayees < ActiveRecord::Migration[5.1]
  def change
    remove_column :payees, :payee_account, :string
  end
end
