# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails.

## Photos

!["photo of app index"](https://github.com/Justin1002/Jungle/blob/master/docs/Screenshot_2021-04-06%20Jungle.png?raw=true)
!["photo of product details"](https://github.com/Justin1002/Jungle/blob/master/docs/Screenshot_2021-04-06%20Jungle(1).png?raw=true)
!["photo of admin product details"](https://github.com/Justin1002/Jungle/blob/master/docs/Screenshot_2021-04-06%20Jungle(2).png?raw=true)
!["photo of order summary"](https://github.com/Justin1002/Jungle/blob/master/docs/Screenshot_2021-04-06%20Jungle(3).png?raw=true)
!["photo of cart summary"](https://github.com/Justin1002/Jungle/blob/master/docs/Screenshot_2021-04-06%20Jungle(4).png?raw=true)

## Additional Stretch features added:

1. Product reviews and product ratings
2. Visual sales cue in the form of an alert
3. Order receipt email summary sent to customer after order

## Future Implementations:

Complete Sales Feature with working functionality for total cart value (currently just visual queue for sales)

## Additional Steps for Apple M1 Machines

1. Make sure that you are runnning Ruby 2.6.6 (`ruby -v`)
1. Install ImageMagick `brew install imagemagick imagemagick@6 --build-from-source`
2. Remove Gemfile.lock
3. Replace Gemfile with version provided [here](https://gist.githubusercontent.com/FrancisBourgouin/831795ae12c4704687a0c2496d91a727/raw/ce8e2104f725f43e56650d404169c7b11c33a5c5/Gemfile)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example (username and password for admin portion of site, email and password of valid gmail account for order receipt feature)
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server


## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
* Rspec
* Capybara
* Database Cleaner
* Poltergeist
