class Status < ApplicationRecord
  validates :user_id, presence: true
  validates :content, presence: true

  has_one :conversation_node, as: :conversationable
  belongs_to :user
end
