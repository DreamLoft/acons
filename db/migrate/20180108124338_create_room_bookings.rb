class CreateRoomBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :room_bookings , id: false do |t|
      t.references :room, foreign_key: true
      t.references :booking, foreign_key: true

      t.timestamps
    end
  end
end
