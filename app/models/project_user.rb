class ProjectUser < ApplicationRecord
  validates :project_id, presence: true
  validates :user_id,    presence: true

  belongs_to :project
  belongs_to :user
end
