# README

## Task
Use Ruby on Rails to build a project conversation history. A user should be able to:

- leave a comment
- change the status of the project

The project conversation history should list comments and changes in status.

## Features
* Devise user registration and authentication
* Create a project
* Set a projects status
* Add a comment to a project

## Setup

Clone respository

bundle install dependencies
```
bundle install
```

database setup
```
rake db:create db:migrate
```

It's reccomended to run the database seed to provide a more testable experience.
```
rake db:seed
```

Start the rails server
```
rails s
```

visit [localhost](http://localhost:3000/)

This project makes use of devise authentication and the seed file provides some users to login with.

`vader@deathstar.glx`\
`tarkin@deathstar.glx`\
`palpatine@deathstar.glx`

The password for all users is `0bi-Wan@Kenobi`

## Questions for colleagues
Are there any designs available?\
*Colleague: Here is a rough sketch on a napkin*\
*Me: Are there any exisitng components we can use for the UI?*\
*Colleague: Yes we have a layout, and input button components we can reuse but the rest will be new*

What order should the conversation be in?\
*Colleague: Newest at the top similar to a trello cards activity, in the future we will give users the ability to sort by their own choice*

Are we expecting to add more objects to the conversation in the future?\
*Colleague: Yes, updates to other project fields and related objects may be added to the conversation*\
*Me: We may want to use polymorphic associations here, it may help later on if we choose to add filters along with the sorting of conversations.*

## What I would do with more time
Add styling, I left the views very barebones to focus more time on features and TDD.

Tidy up test setups with improved factories.

Add error handling, validations are in place to stop empty comment or status values but that is not conveyed to the user.
