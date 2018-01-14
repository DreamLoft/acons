class RoomBooking < ApplicationRecord
  belongs_to :room
  belongs_to :booking

  after_save do |room_booking|
    @room = Room.find(room_booking.room_id)
    @room.room_status= "Booked"
    @room.save
  end
end
