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
      conversation: project.conversation
    )
    tarkins_comment = FactoryBot.create(:comment,
      content: "Yes Lord Vader",
      user: tarkin,
      conversation: project.conversation
    )
    
    login_as(vader, scope: :user)

    visit "/"

    click_on "Death Star"

    expect(page).to have_content "Death Star"
    expect(page).to have_content "Conversation"
    expect(page).to have_content "vader@deathstar.glx"
    expect(page).to have_content "The force is strong within this project"
    expect(page).to have_content "tarkin@deathstar.glx"
    expect(page).to have_content "Yes Lord Vader"
  end
end
