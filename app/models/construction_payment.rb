class ConstructionPayment < ApplicationRecord
  belongs_to :project
  belongs_to :payee
  validates :intermediary, presence: true
end
