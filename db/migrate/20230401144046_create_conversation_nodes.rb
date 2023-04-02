class CreateConversationNodes < ActiveRecord::Migration[7.0]
  def change
    create_table :conversation_nodes do |t|
      t.belongs_to :project
      t.references :conversationable, polymorphic: true

      t.timestamps
    end
  end
end
