class Booking < ApplicationRecord
  has_many :room_services, dependent: :destroy
  has_many :room_bookings, dependent: :destroy
  has_many :rooms, through: :room_bookings
  has_many :payments, dependent: :destroy
  belongs_to :guest

  scope :current_bookings, ->{ where(" ? BETWEEN booked_from AND booked_till " , Date.today) }
  scope :starting_from, ->(starting_date){ where("booked_from >= ?", starting_date) if starting_date.present? }
  scope :ending_at, ->(ending_date){ where("booked_till <= ?" , ending_date) if ending_date.present? }
end
