# Jungle
## Goals
A mini e-commerce application built with Rails 6.1 for purposes of teaching Rails by example.
This project aimed to equip the team with comprehensive knowledge and skills in Ruby and the Rails framework. The primary objectives included mastering code navigation in an existing codebase, implementing new features using unfamiliar techniques, and adapting to a new paradigm, language, and framework.


# Project Contributions

## Implemented Key Features
- **Sold Out Badge**: Added a badge to indicate products with zero quantity on the product list page.
- **Admin Categories**: Enabled category management for admins and streamlined routes for product category association.
- **User Authentication**: Developed a robust authentication system for seamless user sign-up, sign-in, and secure password storage.
- **Enhanced Order Details**: Improved the order page by displaying comprehensive item details, order amounts, and customer email.

## Bug Fixes and Security Measures
- **Admin Security**: Implemented HTTP authentication to secure admin functionalities.
- **Enhanced User Experience**: Provided friendly messages and guidance for users, especially during errors like checking out with an empty cart.

## Collaborative Achievements
- **Team Adaptability**: Navigated the existing codebase, assimilated new techniques, and integrated solutions harmoniously.
- **Adherence to Standards**: Maintained code integrity and consistency with established style guides.

The project highlights collaborative efforts in feature implementation, issue resolution, and security reinforcement while upholding code quality and standards.
# Results
- **Admin login**
!["Admin login"](https://github.com/yhuang82/jungle-rails/blob/master/docs/photo-adminLogin.png)
- **Soldout badge**
!["Soldout badge"](https://github.com/yhuang82/jungle-rails/blob/master/docs/photo-soldoutBadge.png)
- **Product detail**
!["Product detail"](https://github.com/yhuang82/jungle-rails/blob/master/docs/photo-productDetail.png)
- **Invalid login**
!["Invalid login"](https://github.com/yhuang82/jungle-rails/blob/master/docs/photo-invalidLogin.png)
- **Checkout order summary**
!["Checkout order summary"](https://github.com/yhuang82/jungle-rails/blob/master/docs/photo-checkoutOrderSummary.png)


# Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe
