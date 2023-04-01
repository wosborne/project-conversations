class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :content
      t.belongs_to :conversation
      t.belongs_to :user
      
      t.timestamps
    end
  end
end
