class ConversationNode < ApplicationRecord
  validates :project_id, presence: true
  validates :conversationable_id, presence: true

  belongs_to :project
  belongs_to :conversationable, :polymorphic => true

  def user
    conversationable.user
  end

  def content
    conversationable.content
  end
end
