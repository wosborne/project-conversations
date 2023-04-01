class Conversation < ApplicationRecord
  validates :project_id, presence: true

  belongs_to :project
  has_many :comments, -> { order(created_at: :desc) }
  
end
