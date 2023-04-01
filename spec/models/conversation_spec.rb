require 'rails_helper'

RSpec.describe Conversation, :type => :model do
  describe "associations" do
    it { should have_many(:comments) }
    it { should belong_to(:project) }
  end

  describe "validations" do
    it { should validate_presence_of(:project_id) }
  end
end
