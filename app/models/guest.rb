class Guest < ApplicationRecord
	scope :search_by_name, ->(guest_val) { 
		val=('%'+guest_val+'%') if guest_val.present? 
		where("name LIKE (?) OR mobile LIKE (?)", val,val ) if guest_val.present?
	}
end
