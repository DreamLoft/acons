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
    @payment= Payment.new
    @payment.booking_id= booking.id
    @payment.amount_paid= booking.booking_amount
    @payment.payment_method = "On Booking"
    @payment.payment_date= booking.booking_date
    @payment.save
  end
end
