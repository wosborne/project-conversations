class Project < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :project_users
  has_many :users, through: :project_users

  def add_user(user)
    ProjectUser.create(project: self, user: user)
  end
end
