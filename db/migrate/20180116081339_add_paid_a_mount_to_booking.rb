class AddPaidAMountToBooking < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :paid_amount, :integer
  end
end
