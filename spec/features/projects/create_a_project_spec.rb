require "rails_helper"

describe "Create a project" do
  it "create a project and return to the index page" do
    user = FactoryBot.create(:user)
    
    login_as(user, scope: :user)

    visit "/"

    click_on "Create new project"

    fill_in "Name", with: "Death Star"

    click_on "Create Project"

    expect(page).to have_content "Your Projects"
    expect(page).to have_content "Death Star"
  end
end
