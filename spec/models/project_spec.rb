require 'rails_helper'

RSpec.describe Project, :type => :model do
  describe "associations" do
    it { should have_many(:users) }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end

  it "creates a conversation after create" do
    project = FactoryBot.create(:project, name: "Death Star")

    project.reload
    expect(project.conversation).to be_present
  end

  describe "#add_user" do
    it "adds the user to the project" do
      user = FactoryBot.create(:user)
      project = FactoryBot.create(:project, name: "Death Star")

      project.add_user(user)

      expect(project.users).to eq [user]
    end
  end
end
