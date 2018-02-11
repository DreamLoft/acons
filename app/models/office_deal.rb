class OfficeDeal < ApplicationRecord
  belongs_to :office_customer
  belongs_to :apartment
  has_many :apartment_payments
end
