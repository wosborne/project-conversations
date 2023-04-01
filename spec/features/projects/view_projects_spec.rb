require "rails_helper"

describe "View projects" do
  it "should display a list of the users projects" do
    user = FactoryBot.create(:user)
    
    login_as(user, scope: :user)

    visit "/"

    expect(page).to have_content "Your Projects"
    expect(page).to have_content "Death Star"
  end
end
