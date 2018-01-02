class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.string :customer_name
      t.string :customer_email
      t.string :customer_mobile
      t.date :booking_date
      t.integer :total_guests
      t.string :booking_status
      t.date :booked_from
      t.date :booked_till
      t.decimal :booking_amount

      t.timestamps
    end
  end
end
