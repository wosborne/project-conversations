require 'rails_helper'

RSpec.describe ProjectUser, :type => :model do
  describe "associations" do
    it { should belong_to(:project) }
    it { should belong_to(:user) }
  end

  describe "validations" do
    it { should validate_presence_of(:project_id) }
    it { should validate_presence_of(:user_id) }
  end
end
