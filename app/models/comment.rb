class Comment < ApplicationRecord
  validates :conversation_id, presence: true
  validates :user_id,         presence: true
  validates :content,         presence: true

  belongs_to :conversation
  belongs_to :user
end
