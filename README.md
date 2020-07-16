# Endpoints

List of resources.   
'/api/v1/resource'.   
List by id.   
'/api/v1/resource/:id'.  
Relationships.   
'/api/v1/merchants/:id/items' - Merchant with all thier items.   
'/api/v1/items/:id/merchant' - Item with associated merchant.   
'/api/v1/merchants/find?<attribute>=<value>' Locate merchant by name.  
Business Intellignce.    
'/api/v1/merchants/find_all?<attribute>=<value>' Locate all merchants with related name.  
'/api/v1/merchants/most_revenue?quantity=<value>'. List of merchants with highest revenue (quantity will return that many top revenues).   
'/api/v1/merchants/most_items?quantity=<value>'. List of merchants with most items sold  (quantity will return that many top revenues).  


# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
