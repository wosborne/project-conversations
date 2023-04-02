require 'rails_helper'

RSpec.describe ConversationNode, :type => :model do
  describe "associations" do
    it { should belong_to(:conversationable) }
    it { should belong_to(:project) }
  end

  describe "validations" do
    it { should validate_presence_of(:project_id) }
    it { should validate_presence_of(:conversationable_id) }
  end

  it "#content" do
    vader = FactoryBot.create(:user, email: "vader@deathstar.glx")
    project = FactoryBot.create(:project, name: "Death Star")

    status = FactoryBot.create(:status,
      content: "90% Finished",
      user: vader,
    )
    node = FactoryBot.create(:conversation_node, project: project, conversationable: status)

    expect(node.content).to eq "90% Finished"
  end

  it "#user" do
    vader = FactoryBot.create(:user, email: "vader@deathstar.glx")
    project = FactoryBot.create(:project, name: "Death Star")

    status = FactoryBot.create(:status,
      content: "90% Finished",
      user: vader,
    )
    node = FactoryBot.create(:conversation_node, project: project, conversationable: status)

    expect(node.user).to eq vader
  end
end
