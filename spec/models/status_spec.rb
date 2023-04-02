require 'rails_helper'

RSpec.describe Status, :type => :model do
  describe "associations" do
    it { should have_one(:conversation_node) }
    it { should belong_to(:user) }
  end

  describe "validations" do
    it { should validate_presence_of(:content) }
  end
end
