class Booking < ApplicationRecord
  has_many :room_services
  has_many :room_bookings
  has_many :rooms, through: :room_bookings
  has_many :payments
  def create_guest(booking)
    Guest.find_or_create_by(mobile: booking.customer_mobile) do |g|
      g.name= booking.customer_name
      g.mobile= booking.customer_mobile
      g.email= booking.customer_email
      g.save
    end
  end
   after_save do |booking|
     create_guest(booking)
   end

   scope :current_bookings, ->{ where(" ? BETWEEN booked_from AND booked_till " , Date.today) }
   scope :starting_from, ->(starting_date){ where(" ? BETWEEN booked_from AND booked_till " , starting_date) if starting_date.present? }
   scope :ending_at, ->(ending_date){ where(" ? BETWEEN booked_from AND booked_till " , ending_date) if ending_date.present? }
end
