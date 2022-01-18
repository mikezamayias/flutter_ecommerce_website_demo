Human Computer Interaction Lab
==============

***Semester Project 2021***

**Author:** *Michail Anargyros Zamagias, TP5000*

**Project Title:** *flutter_ecommerce_website_demo*

**Project Description:** *A project for the final project of the course Human Computer Interaction of the Lab class at the Hellenic Mediterranean University. Built with Flutter and Firebase.*

---
[![wakatime](https://wakatime.com/badge/user/14aaa887-f33c-4964-831a-f5571f887a02/project/c591ac2b-cc58-447c-a89c-03ea95885fc1.svg)](https://wakatime.com/badge/user/14aaa887-f33c-4964-831a-f5571f887a02/project/c591ac2b-cc58-447c-a89c-03ea95885fc1)
---

## Table of Contents
- [Specifications](#specifications)
  - [Description](#description)
  - [Functionality](#functionality)
    - [Registration page](#registration-page)
    - [Login page](#login-page)
    - [Home page (ecommerce)](#home-page-ecommerce)
    - [My orders page](#my-orders-page)
    - [Cart page](#cart-page)
    - [Contact page](#contact-page)
    - [Footer](#footer)
  - [Design](#design)
  - [Models](#models)
    - [Phone](#phone)
    - [User](#user)
    - [Cart](#cart)
    - [Order](#order)

# Specifications
## Description
Design and develop an ecommerce website for a shop that sells mobile phones. The website should be responsive and should be able to be used on any device. You can reuse any of your previous projects.

## Functionality
### Registration page
In this page, a user can register to the website. Required fields are:
- First name
- Last name
- Email
- Password
- Confirm password
- Address
- City
- Phone number

Required validation:
- All fields are required
- Email must be valid
- Password must be at least 8 latin characters long and contain at least one capital letter, one lowercase letter, one number and one special character
- Confirm password must match the password

### Login page
User enters his email and password and clicks the login button.
- If the user is registered, he is redirected to the home page. If not, an error message is displayed.
- If user is logged in, a logout button is displayed instead of the register and login button.

### Home page (ecommerce)
User can browse products and add them to the cart. At the top of the page, there is a cart icon. When clicked, the user is redirected to the cart page. At least 24 products are displayed in cards. Each card contains the product image, the product name, the product price and a button to add the product to the cart.
The product card opens a modal window when clicked. The modal window contains the product image, the product name, the product specs,the product price and a button to add the product to the cart.

When the buy button is clicked, the following checks are performed:
- If the user is logged in
- If the product is already in the cart
- If the product is in stock (quantity > 0)

Upon successful order, user is redirected to [My Orders](#3-my-orders-page) page and a modal window is displayed with a successful order message. The modal window closes after 5 seconds.


### My orders page
User can view his orders. Products are displayed in product cards with the following information:
- Product image
- Product name
- Product specs
- Order date

### Cart page
User can view his cart and remove products from it. A product card opens a modal window when clicked. The modal window contains the product image, the product name, the product specs, the product price and a button to remove the product from the cart.

### Contact page
There is a contact form with the following required fields:
- Name
- Email
- Subject
- Message

There's a send button. When clicked, the form is validated, the validation performed is:
- All fields are required
- Email must be valid

If the form is valid, an email is sent to the admin.

### ~~Footer~~
The footer contains the following information:
- Address
- Phone number
- Email
- About us

## Design
In short, the website should be responsive for any device and the layout should be simple and clean with the following structure:
- Navigation bar
    - Shop logo (directs to home page)
    - Register button (directs to registration page, doesn't appear if user is logged in)
    - Login button (directs to login page, doesn't appear if user is logged in)
    - Cart button (directs to cart page)
    - Orders button (directs to orders page, appears if user is logged in)
    - Contact button (directs to contact page)
    - Logout button (directs to home page, appears if user is logged in)
- Current page [Home page, Registration page, Login page, Cart page, Orders page, Contact page]
- Home page
    - Products
        - Product card
            - Product image
            - Product name
            - Product specs
            - Product price
            - Add to cart button
- Registration page
    - Form
        - First name
        - Last name
        - Email
        - Password
        - Confirm password
        - Address
        - City
        - Phone number
        - Register button
- Login page
    - Form
        - Email
        - Password
        - Login button
- Cart page
    - Product card
        - Product image
        - Product name
        - Product specs
        - Product price
        - Remove from cart button
- Orders page
    - Product card
        - Product image
        - Product name
        - Product specs
        - Order date
- Contact page
    - Form
        - Name
        - Email
        - Subject
        - Message
        - Send button
- Footer
    - Address
    - Phone number
    - Email
    - About us

## Models
### Phone
- price: float
- quantity: int
- photoURL: string
- model: string
- screenSize: float
- CPU: string
- RAM: int
- camera: string
- battery: int
- SAR: int
### User
- firstName: string
- lastName: string
- email: string
- password: string
- address: string
- city: string
- phoneNumber: string

### Cart
- user: User
- products: [Phone]

### Order
- orderid: int
- products: [Phone]
- userid: User
- date: date