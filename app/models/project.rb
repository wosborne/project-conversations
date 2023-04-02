class Project < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :project_users
  has_many :users, through: :project_users
  has_many :conversation_nodes, -> { order(created_at: :desc) }
  has_many :statuses, through: :conversation_nodes, :source => :conversationable, :source_type => "Status"

  def add_user(user)
    ProjectUser.create(project: self, user: user)
  end

  def status
    statuses.order(created_at: :desc).first
  end

  def add_conversation_node(conversationable)
    ConversationNode.create(project: self, conversationable: conversationable)
  end
end
