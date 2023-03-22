# README

A companion project for a blog post on ActiveModel and how it can be useful when the form presented to a user does not 1-1 match the underlying database table.

Make sure you have ruby version as specified in `.ruby-version`.

```
bundle install
bin/rails db:create
bin/rails db:migrate
bin/rails s
```

Click "New Customer" from http://localhost:3000/ or navigate to http://localhost:3000/customers/new.
