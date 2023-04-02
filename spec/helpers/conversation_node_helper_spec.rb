require "rails_helper"

RSpec.describe ConversationNodeHelper do
  describe "#format_node_content" do
    it "returns formated content for a Status" do
      user = FactoryBot.create(:user)
      project = FactoryBot.create(:project, name: "Death Star")
      destroyed_status = FactoryBot.create(:status,
        content: "90% Finished",
        user: user,
      )
      node = FactoryBot.create(:status_node,
        conversationable: destroyed_status,
        project: project
      )

      expect(helper.format_node_content(node)).to eq "Changed project status to: 90% Finished"
    end
  end 
end
