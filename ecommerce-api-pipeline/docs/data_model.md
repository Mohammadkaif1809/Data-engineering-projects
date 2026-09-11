# Data Model

The project uses a relational data model created from the nested JSON
responses received from the DummyJSON API.

## Main Entities

- Products
- Users
- Carts
- Cart Products

## Product Relationships

products.id
→ product_reviews.product_id
→ product_dimensions.product_id
→ product_meta.product_id
→ product_images.product_id
→ product_tags.product_id

## User Relationships

users.id
→ carts.userId

users.id
→ user_hair.user_id
→ user_address.user_id
→ user_coordinates.user_id
→ user_bank.user_id
→ user_company.user_id
→ user_crypto.user_id

## Cart Relationships

carts.id
→ cart_products.cart_id

products.id
→ cart_products.product_id

## Main Business Relationship

users
→ carts
→ cart_products
→ products

This relationship allows customer spending, cart behaviour, product
revenue, product popularity, category performance, and other business
metrics to be analysed using SQL.