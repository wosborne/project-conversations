class Project < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :project_users
  has_many :users, through: :project_users
  has_one :conversation

  after_create :create_conversation

  def add_user(user)
    ProjectUser.create(project: self, user: user)
  end

  private

  def create_conversation
    return if self.conversation&.exists?

    Conversation.create(project_id: id)
  end
end
