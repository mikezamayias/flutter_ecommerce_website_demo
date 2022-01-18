Human Computer Interaction Lab
==============

***Semester Project 2021***

**Author:** *Michail Anargyros Zamagias, TP5000*

**Project Title:** *flutter_ecommerce_website_demo*

**Project Description:** *A project for the final project of the course Human Computer Interaction of the Lab class at the Hellenic Mediterranean University. Built with Flutter and Firebase.*


# Report

The user authentication is implemented with Firebase and the database with Firestore.
The Logo in the header is implemented routes to Home view where the phones are. Sign Up amd Log In views are self explanatory. Logout is implemented with a button in the navigation bar. When a user is logged in, the navigation bar buttons change accordingly, ie the Orders button does not appear if the user is not logged in because there are no data to show.

An addition I made was the Add a phone page, in ait to help me populate the database with phones as I was not able to find any third-party and working API on the internet. It's functionality is to add a phone to the database. It could also be used by an admin to add a phone to the database of their company.


You could browse the live page and demo it [here](https://flutter-ecommerce-website-demo.web.app/) (hosted on Firebase).


---
## Some interesting statistics about the project
The assignment was completed in [![wakatime](https://wakatime.com/badge/user/14aaa887-f33c-4964-831a-f5571f887a02/project/c591ac2b-cc58-447c-a89c-03ea95885fc1.svg)](https://wakatime.com/badge/user/14aaa887-f33c-4964-831a-f5571f887a02/project/c591ac2b-cc58-447c-a89c-03ea95885fc1), and took over 3700 lines of dart code.
```bash
(base) ➜  flutter_ecommerce_website_demo git:(master) ✗ find . -name '*.dart' | xargs wc -l | sort -n
       9 ./lib/routing/routes.dart
       9 ./lib/services/scaffold_service.dart
      10 ./lib/services/navigation_service.dart
      11 ./lib/models/dialog/dialog_reponse.dart
      13 ./lib/models/dialog/dialog_request.dart
      14 ./.dart_tool/flutter_build/a5bba4548db47b0c4d2f849926e54f71/main.dart
      16 ./lib/main.dart
      16 ./lib/models/footer/info_field/footer_info_field_model.dart
      17 ./lib/extensions/padding_extension.dart
      18 ./lib/services/form_service.dart
      18 ./lib/views/cart/cart_view.dart
      18 ./lib/views/orders/orders_page.dart
      19 ./lib/locator.dart
      19 ./lib/views/contact/contact_view.dart
      22 ./lib/generated_plugin_registrant.dart
      22 ./lib/models/user/user_model.dart
      24 ./lib/widgets/navigation_items/home_navigation_item.dart
      25 ./lib/widgets/navigation/navigation_bar_logo.dart
      25 ./lib/widgets/navigation_items/add_phone_navigation_item.dart
      25 ./lib/widgets/navigation_items/menu_navigation_item.dart
      25 ./lib/widgets/navigation_items/sign_up_navigation_item.dart
      26 ./.dart_tool/build/entrypoint/build.dart
      26 ./lib/models/phone/phone_model.dart
      26 ./lib/widgets/footer_field/footer_fields.dart
      26 ./lib/widgets/navigation_items/cart_navigation_item.dart
      26 ./lib/widgets/navigation_items/log_in_navigation_item.dart
      26 ./lib/widgets/navigation_items/orders_navigation_item.dart
      27 ./lib/widgets/navigation_items/contact_navigation_item.dart
      27 ./lib/widgets/note_text/note_text.dart
      28 ./lib/widgets/footer/footer.dart
      29 ./lib/view_models/home/home_view_model.dart
      30 ./lib/extensions/hover_extension.dart
      30 ./lib/models/user/user_model.g.dart
      30 ./lib/widgets/navigation_items/log_out_navigation_item.dart
      30 ./test/widget_test.dart
      31 ./lib/shared/ui/shared_styles.dart
      33 ./lib/widgets/navigation/mobile_navigation_bar.dart
      37 ./lib/widgets/navigation_items/navigation_item.dart
      38 ./lib/shared/ui/ui_helpers.dart
      39 ./lib/models/phone/phone_model.g.dart
      50 ./lib/view_models/log_in/log_in_view_model.dart
      50 ./lib/widgets/footer_field/footer_field_blueprint.dart
      51 ./lib/routing/router.dart
      54 ./lib/widgets/translate_on_hover/translate_on_hover.dart
      55 ./lib/firebase_options.dart
      56 ./lib/services/dialog_service.dart
      56 ./lib/widgets/busy_button.dart
      57 ./lib/view_models/phone/add_phone_view_model.dart
      58 ./lib/views/dialog_manager.dart
      64 ./lib/widgets/navigation/desktop_navigation_bar.dart
      70 ./lib/themes/custom_theme_data.dart
      71 ./lib/views/log_in/log_in_view.dart
      72 ./lib/services/authentication_service.dart
      73 ./lib/widgets/phone_details/phone_details.dart
      75 ./lib/view_models/sign_up/sign_up_view_model.dart
      89 ./lib/widgets/custom_text_form_field.dart
     107 ./lib/widgets/navigation/custom_navigation_drawer.dart
     115 ./lib/views/home/home_view.dart
     123 ./lib/flutter_ecommerce_website_demo.dart
     124 ./lib/services/firestore_service.dart
     142 ./lib/views/sign_up/sign_up_view.dart
     161 ./lib/views/phone/phone_view.dart
     237 ./lib/shared/validators.dart
     331 ./lib/models/user/user_model.freezed.dart
     422 ./lib/models/phone/phone_model.freezed.dart
    3703 total
```


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
- phoneNumber: string
- address: string
- city: string
- postalCode: int

### Cart
- user: User
- products: [Phone]

### Order
- orderid: int
- products: [Phone]
- userid: User
- date: date