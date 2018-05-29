# SyntaxError

![homepage demo](https://github.com/alanzheng88/syntaxerror/blob/master/images/homepage.png)
![administration demo](https://github.com/alanzheng88/syntaxerror/blob/master/images/administration.png)

## Setup

1. Install dependencies
```
bundle install
```
2. Install Postgres, and create the database & user for login:
```
psql
CREATE CREATE USER syntaxerror WITH SUPERUSER PASSWORD 'Password1';
CREATE DATABASE syntaxerror_development;
```
3. Create users, roles and tables and seed data
```
rake db:migrate RAILS_ENV=development
rake db:seed
```
4. Start the server
```
rails s
```
5. Go to localhost:3000

## Login with the following users

- [Administrator] username: wendylee  password: Password123
- See db/seeds.rb for other possible login users


