require 'rails_helper'

RSpec.describe Conversation, :type => :model do
  describe "associations" do
    it { should have_many(:comments) }
    it { should belong_to(:project) }
  end

  describe "validations" do
    it { should validate_presence_of(:project_id) }
  end

  describe "comments" do
    it "returns comments in order of newest first by default" do
      vader = FactoryBot.create(:user, email: "vader@deathstar.glx")
      tarkin = FactoryBot.create(:user, email: "tarkin@deathstar.glx")  
      project = FactoryBot.create(:project, name: "Death Star")
      project.add_user(vader)
      project.add_user(tarkin)
  
      project.reload

      travel_to "2020-01-01 10:00".in_time_zone("UTC")

      vaders_comment = FactoryBot.create(:comment,
        content: "The force is strong within this project",
        user: vader,
        conversation: project.conversation
      )

      travel_to "2020-01-01 11:00".in_time_zone("UTC")

      tarkins_comment = FactoryBot.create(:comment,
        content: "Yes Lord Vader",
        user: tarkin,
        conversation: project.conversation
      )

      expect(project.conversation.comments).to eq [tarkins_comment, vaders_comment]
    end
  end
end
