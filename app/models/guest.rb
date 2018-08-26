class Guest < ApplicationRecord
	has_many :bookings, dependent: :destroy
	scope :search_by_name, ->(guest_val) { 
		val=('%'+guest_val+'%') if guest_val.present? 
		where("LOWER(name) LIKE (?) OR mobile LIKE (?)", val.downcase,val ) if guest_val.present?
	}
end
