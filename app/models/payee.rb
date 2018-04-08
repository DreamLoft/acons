class Payee < ApplicationRecord
  belongs_to :payee_category
  has_many :construction_payments
end
