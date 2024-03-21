# README
# Create app
rails new Web_AI_Math


locallhost:3000
rails server

# create scaffold
rails generate scaffold User name:string email:string

# create controller
rails generate controller Pages home

rails generate controller sessions new

# update database
rails db:migrate

# destroy database while update database before
rails db:rollback

# use table
rails console

# install lib
bundle install


# create model(name, email)
rails generate model User name:string email:string

# create migration
rails generate migration add_index_to_users_email



# use test
rails test
 
# delete memory style
rake assets:clobber
format: { with: VALID_EMAIL_REGEX },





##### error
khong hien loi dang nhap