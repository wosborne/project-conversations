require "rails_helper"

describe "Create a comment" do
  it "should display the new comment and it's user in the projects conversation" do
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
    FactoryBot.create(:comment_node,
      conversationable: vaders_comment,
      project: project
    )
    
    login_as(tarkin, scope: :user)

    visit "/"

    click_on "Death Star"

    expect(page).to have_content "vader@deathstar.glx"
    expect(page).to have_content "The force is strong within this project"

    fill_in "Add comment", with: "Yes Lord Vader"

    click_on "Save"

    expect(page).to have_content "tarkin@deathstar.glx"
    expect(page).to have_content "Yes Lord Vader"
    expect(page).to have_content "Comment added"
  end
end
