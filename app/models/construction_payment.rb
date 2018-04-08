class ConstructionPayment < ApplicationRecord
  belongs_to :project
  belongs_to :payee
end
