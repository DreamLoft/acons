class ConstructionPayment < ApplicationRecord
  belongs_to :project
  belongs_to :payee
  validates :intermediary, presence: true
  scope :search_by_project, ->(project_id) { where(project_id: project_id) if project_id.present? }
  scope :search_by_payee, ->(payee_id) { where(payee_id: payee_id) if payee_id.present? }
  scope :search_by_intermediary, ->(intermediary_id) { where(intermediary: intermediary_id) if intermediary_id.present? }
end
