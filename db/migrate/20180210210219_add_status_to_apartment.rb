class AddStatusToApartment < ActiveRecord::Migration[5.1]
  def change
    add_column :apartments, :status, :string
  end
end
