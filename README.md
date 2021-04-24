# README

## Created Using
- Ruby version - 3.0.0
- Rails version - 6.1.3
- PostgreSql - 13.2

## Setup
- Database creation
  From your terminal run:
    `rake db:setup`
    This will create the database locally using postgresql
- Database initialization
  From your terminal run:
    `rake db:seed`
    This seed the database with 2 customers, and 3 products with stock levels
- Start the server
  From your terminal run:
  `rails s`


## Use
With your local server running, you can access endpoints of the API through your browser or preferred API testing tool:
#### Create a new Customer
`localhost:3000/customers?name=Josh J&email=josh@email.com`

#### Get a list of Products
`localhost:3000/products`

#### Create new Order for given Customer
`localhost:3000/customers/1/orders?sku=abc133`

#### Get Orders for given Customer
`localhost:3000/customers/1/orders`

#### Check Product Availability
`localhost:3000/customers/1/notifications?sku=abc133`
