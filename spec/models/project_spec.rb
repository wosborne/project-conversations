require 'rails_helper'

RSpec.describe Project, :type => :model do
  describe "associations" do
    it { should have_many(:users) }
    it { should have_many(:conversation_nodes)}
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end

  describe "#add_user" do
    it "adds the user to the project" do
      user = FactoryBot.create(:user)
      project = FactoryBot.create(:project, name: "Death Star")

      project.add_user(user)

      expect(project.users).to eq [user]
    end
  end

  describe "#status" do
    it "returns the most recent status" do
      user = FactoryBot.create(:user)
      project = FactoryBot.create(:project, name: "Death Star")

      travel_to "2020-01-01 10:00".in_time_zone("UTC")

      nintey_status = FactoryBot.create(:status,
        content: "90% Finished",
        user: user,
      )
      FactoryBot.create(:status_node,
        conversationable: nintey_status,
        project: project
      )

      travel_to "2020-01-01 11:00".in_time_zone("UTC")

      destroyed_status = FactoryBot.create(:status,
        content: "90% Finished",
        user: user,
      )
      FactoryBot.create(:status_node,
        conversationable:destroyed_status,
        project: project
      )

      expect(project.status).to eq destroyed_status
    end
  end
end
