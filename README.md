## Generic Recommendation System with collaborative filtering
  See more about Recommendation System: https://en.wikipedia.org/wiki/Recommender_system
  
  See more about Collaborative Filtering: https://en.wikipedia.org/wiki/Collaborative_filtering

* Ruby version: 2.4.4p296

* Rails version: 5.2.3

* System dependencies: postgresql

## Configuration:
If you want to change the Items, you probably need to re-create the model of the item and modify the item details page, the partial search page and the partial item page.

As example, the model and all that pages for Serie as a item is already done.

## Re-crete model item:
Delete the actual model item:

    $ rails destroy model item

and then create the new item model:

    $ rails g model item

Optional: you probably want to add some columns for your new item model, like:

    $ rails g model item title_field number_field:integer date_field:datetime

after that, open the model in app/models/item.rb and add this line in the class Item:
 ```ruby
has_many :ratings
```

## Edit Partial Search Page:
If you changed the item model, you probably needs to edit the Partial Search page in app/views/items/_search.html.erb

## Edit Partial Item Page:
If you changed the item model, you probably needs to edit the Partial Item page in app/views/items/_item.html.erb

## Edit Item Details Page:
If you changed the item model, you probably needs to edit the Item Details page in app/views/items/show.html.erb

## Installation:
First execute:

    $ bundle install

then execute:

    $ yarn install

and then:

    $ RAILS_ENV=production bundle exec rake assets:precompile

## Database creation
    $ rails db:create db:migrate RAILS_ENV=production

## Database initialization
First you need to edit the file: db/seeds.rb, like the example already done, to it get all the initial items and save one by one in the database.
After the seeds.rb archive is already done, run:

    $ rails db:seed RAILS_ENV=production

## Running server:
Just run:

    $ rails s -e production

