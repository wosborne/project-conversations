require "rails_helper"

describe "Update project status" do
  it "should display a projects updated status" do
    vader = FactoryBot.create(:user, email: "vader@deathstar.glx")
    project = FactoryBot.create(:project, name: "Death Star")
    project.add_user(vader)

    status = FactoryBot.create(:status,
      content: "90% Finished",
      user: vader,
    )
    FactoryBot.create(:conversation_node, project: project, conversationable: status)
    
    login_as(vader, scope: :user)

    visit "/"

    click_on "Death Star"

    expect(page).to have_css("#status", text: "90% Finished")

    fill_in "Set project status", with: "Destroyed"
    click_on "Save status"

    expect(page).to have_css("#status", text: "Destroyed")
    expect(page).to have_content "Status updated"
  end

  it "should display a status change in the projects conversation" do
    vader = FactoryBot.create(:user, email: "vader@deathstar.glx")
    project = FactoryBot.create(:project, name: "Death Star")
    project.add_user(vader)

    status = FactoryBot.create(:status,
      content: "90% Finished",
      user: vader,
    )
    FactoryBot.create(:conversation_node, project: project, conversationable: status)
    
    login_as(vader, scope: :user)

    visit "/"

    click_on "Death Star"

    expect(page).to have_css("#conversation", text: "Changed project status to: 90% Finished")
    expect(page).not_to have_css("#conversation", text: "Changed project status to: Destroyed")

    fill_in "Set project status", with: "Destroyed"
    click_on "Save status"

    expect(page).to have_css("#conversation", text: "Changed project status to: Destroyed")
  end
end
