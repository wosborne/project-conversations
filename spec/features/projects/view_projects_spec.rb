require "rails_helper"

describe "View projects" do
  it "should display a list of the users projects" do
    user = FactoryBot.create(:user)
    project = FactoryBot.create(:project, name: "Death Star")
    project.add_user(user)
    
    login_as(user, scope: :user)

    visit "/"

    expect(page).to have_content "Your Projects"
    expect(page).to have_content "Death Star"
  end
end
