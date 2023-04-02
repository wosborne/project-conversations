require "rails_helper"

describe "View a project" do
  it "should display a project and it's conversation" do
    vader = FactoryBot.create(:user, email: "vader@deathstar.glx")
    tarkin = FactoryBot.create(:user, email: "tarkin@deathstar.glx")
    project = FactoryBot.create(:project, name: "Death Star")
    project.add_user(vader)
    project.add_user(tarkin)

    project.reload

    vaders_comment = FactoryBot.create(:comment,
      content: "The force is strong within this project",
      user: vader,
    )
    FactoryBot.create(:conversation_node, project: project, conversationable: vaders_comment)

    tarkins_comment = FactoryBot.create(:comment,
      content: "Yes Lord Vader",
      user: tarkin,
    )
    FactoryBot.create(:conversation_node, project: project, conversationable: tarkins_comment)

    tarkins_status = FactoryBot.create(:status,
      content: "Approved",
      user: tarkin,
    )
    FactoryBot.create(:conversation_node, project: project, conversationable: tarkins_status)
    
    login_as(vader, scope: :user)

    visit "/"

    click_on "Death Star"

    expect(page).to have_css("#project-name", text: "Death Star")
    expect(page).to have_css("#status", text: "Approved")
    expect(page).to have_css("#conversation", text:  "Conversation")
    expect(page).to have_css("#conversation", text:  "vader@deathstar.glx")
    expect(page).to have_css("#conversation", text:  "The force is strong within this project")
    expect(page).to have_css("#conversation", text: "tarkin@deathstar.glx")
    expect(page).to have_css("#conversation", text:  "Yes Lord Vader")
    expect(page).to have_css("#conversation", text:  "Changed project status to: Approved")
  end
end
