class OfficeDeal < ApplicationRecord
  belongs_to :office_customer
  belongs_to :apartment
end
