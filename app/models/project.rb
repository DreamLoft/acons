class Project < ApplicationRecord
  has_many :apartments, dependent: :destroy
end
