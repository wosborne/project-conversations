class Conversation < ApplicationRecord
  validates :project_id, presence: true

  belongs_to :project
  has_many :comments
end
