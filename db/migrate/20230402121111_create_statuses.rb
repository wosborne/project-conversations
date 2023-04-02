class CreateStatuses < ActiveRecord::Migration[7.0]
  def change
    create_table :statuses do |t|
      t.string :content
      t.belongs_to :user

      t.timestamps
    end
  end
end
