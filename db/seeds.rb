vader = FactoryBot.create(:user, email: "vader@deathstar.glx", password: "0bi-Wan@Kenobi" )
tarkin = FactoryBot.create(:user, email: "tarkin@deathstar.glx", password: "0bi-Wan@Kenobi" )
palpatine = FactoryBot.create(:user, email: "palpatine@deathstar.glx", password: "0bi-Wan@Kenobi" )

death_star = FactoryBot.create(:project, name: "Death Star")
death_star.add_user(vader)
death_star.add_user(tarkin)
death_star.add_user(palpatine)

# Add comments and status changes to death_star
vaders_comment = FactoryBot.create(:comment,
  content: "The force is strong within this project",
  user: vader,
  created_at: 1.year.ago
)
FactoryBot.create(:conversation_node, project: death_star, conversationable: vaders_comment)

tarkins_comment = FactoryBot.create(:comment,
  content: "Yes Lord Vader",
  user: tarkin,
  created_at: 1.year.ago + 10.minutes
)
FactoryBot.create(:conversation_node, project: death_star, conversationable: tarkins_comment)

tarkins_status = FactoryBot.create(:status,
  content: "Approved",
  user: tarkin,
  created_at: 1.year.ago + 4.days - 10.minutes
)
FactoryBot.create(:conversation_node, project: death_star, conversationable: tarkins_status)

# Add comments and status changes to star destroyer
star_destroyer = FactoryBot.create(:project, name: "Star Destroyer 2.0")
star_destroyer.add_user(vader)
star_destroyer.add_user(tarkin)
star_destroyer.add_user(palpatine)

palpatine_status = FactoryBot.create(:status,
  content: "Planning",
  user: tarkin,
  created_at: 1.week.ago
)
FactoryBot.create(:conversation_node, project: star_destroyer, conversationable: palpatine_status)

palpatine_destroyer_comment = FactoryBot.create(:comment,
  content: "It will be even more powerful",
  user: vader,
  created_at: 3.days.ago - 20.minutes
)
FactoryBot.create(:conversation_node, project: star_destroyer, conversationable: palpatine_destroyer_comment)

vaders_destroyer_comment = FactoryBot.create(:comment,
  content: "As you wish Master",
  user: vader,
  created_at: 3.days.ago
)
FactoryBot.create(:conversation_node, project: star_destroyer, conversationable: vaders_destroyer_comment)
