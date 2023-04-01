require "rails_helper"

describe "Update project status" do
  it "should display a projects updated status" do
    vader = FactoryBot.create(:user, email: "vader@deathstar.glx")
    project = FactoryBot.create(:project, name: "Death Star", status: "90% Finished")
    project.add_user(vader)

    project.reload
    
    login_as(vader, scope: :user)

    visit "/"

    click_on "Death Star"

    expect(page).to have_content "90% Finished"

    fill_in "Set project status", with: "Destroyed"
    click_on "Save status"

    expect(page).to have_content "Destroyed"
    expect(page).to have_content "Status updated"
  end
end
