@healthCheck
Feature: E-Commerce website healthcheck

  Background: Navigation to the URL
    Given User navigate to URL and open the landing page

  @URLRedirection
  Scenario: User naviaget to URL, User redirect to landing page with expected current URL
    When User is on landing page
    Then Validate current URL of landing page with expected URL

  @LandingPageTitle
  Scenario: User naviaget to URL, User redirect to landing page with expected page title
    When User is on landing page
    Then Validate title of landing page with expected title as "Online Jewellery Shopping India | Candere By Kalyan Jewellers | Most Trusted Online Jewellery Store"

  ##############Login Related Test Cases #################
  @e2eMultipleitemsSignup
  Scenario Outline: Validate the multiple items add functionality with signup
    When User search for "<product>"
    And choose to buy the first item
    And Add product to shopping cart
    And User clicks on continue shopping
    And User search for "<product1>"
    And choose to buy the second item
    And Add this item to the cart
    And User Click on proceed to check out
    And User are able to see the signup and login popup and click on signup
    And User enters  "<name>"  and  "<emailid>" and "<mobileno>"
    And User click on Send Otp
    And User enter otp
    And Click on Verify Otp & Register
    And Shipping page is open then user fill all details "<lastname>"  and  "<mobile>" and "<zip>" and "<flat>"  and  click on continue
    And User see the payment page and click on UPI
    And User enter "<UPIId>" and click on placeorder
    And User see the cander razorpay page
    And User mouseover to my account and click on my order
    And Click on view details and scroll down
    Then Go back to my orders

    Examples: 
      | product | product1 | name | emailid             | mobileno   | lastname | mobile     | zip    | flat                                    | UPIId         |
      | Earring | ring     | Dev  | Dev6734@candere.com | 8378945745 | rane     | 9023458934 | 400068 | flat no 701,sanlkalp chsl Borivali east | anything@payu |

  @e2eLoginCheckoutUPILogin 
  Scenario Outline: Validate if User should be login and then go to place the the order 
    When User see Your Account and click on  Log In  from home page
    And User enters "<Emailidmobileno>"
    And User click on continue button
    And User enter otp manually and click on login
    And User click on product type Chain
    And User choose to buy the first item
    And Product Desc is displayed in new tab
    And User click on add to cart
    And User click on Checkout Securely
    And Click on SHIP TO NEARBY CANDERE/KALYAN STORE
    And User enter "<pincode>" and click on submit
    And User select the store address
    And User select the payment method CreditDebit Card
    And User enter "<CardNumber>" and "<NameOnCard>"  and  "<CVV>"  and  "<ExpiryYear>"  and  "<ExpiryMonth>" click on placeorder
    And User see the cander razorpay page
    And User mouseover to my account and click on my order
    And Click on view details and scroll down
    Then Go back to my orders

    Examples: 
      | Emailidmobileno     | pincode | UPIId         | product | CardNumber          | NameOnCard | CVV | ExpiryYear | ExpiryMonth |
      | Dev1234@candere.com |  400066 | anything@payu | Rings   | 4111 1111 1111 1111 | testing    | 123 |         23 |          10 |

  @e2eMultipleitemseditusinggoogle
  Scenario Outline: Validate the multiple items add functionality using google login
    When User search for "<product>"
    And choose to buy the first item
    And Add product to shopping cart
    And User clicks on continue shopping
    And User search for "<product1>"
    And choose to buy the second item
    And Add this item to the cart
    And User click on Checkout Securely
    And User click on Login Using Google
    And User enters Emailid or mobileno ,password and click on next button on checkout page
    And User click on edit order
    And User are able to remove the item on cart page
    And User are able to see the popup Do you want to remove this product from Cart ?
    And User clicks on OK buttton
    And User click on Checkout Securely
    And User see the payment page and click on UPI
    And User enter "<UPIId>" and click on placeorder
    And User see the cander razorpay page
    And User mouseover to my account and click on my order
    And Click on view details and scroll down
    Then Go back to my orders

    Examples: 
      | product | product1 | name    | emailid          | mobileno   | lastname | mobile     | zip    | flat                                    | UPIId         |
      | Earring | ring     | Dewtfqw | zscywu@gmail.com | 8456901278 | rane     | 9023458934 | 400068 | flat no 701,sanlkalp chsl Borivali east | anything@payu |

      
  @e2eMultipleitemseditusinggoogle
  Scenario Outline: Validate the multiple items add functionality using google login
    When User search for "<product>"
    And choose to buy the first item
    And Add product to shopping cart
    And User clicks on continue shopping
    And User search for "<product1>"
    And choose to buy the second item
    And Add this item to the cart
    And User click on Checkout Securely
    And User click on Login Using Google
    And User enters Emailid or mobileno ,password and click on next button on checkout page
    And User click on edit order
    And User are able to remove the item on cart page
    And User are able to see the popup Do you want to remove this product from Cart ?
    And User clicks on OK buttton
    And User click on Checkout Securely
    And User see the payment page and click on UPI
    And User enter "<UPIId>" and click on placeorder
    And User see the cander razorpay page
    And User mouseover to my account and click on my order
    And Click on view details and scroll down
    Then Go back to my orders

    Examples: 
      | product | product1 | name    | emailid          | mobileno   | lastname | mobile     | zip    | flat                                    | UPIId         |
      | Earring | ring     | Dewtfqw | zscywu@gmail.com | 8456901278 | rane     | 9023458934 | 400068 | flat no 701,sanlkalp chsl Borivali east | anything@payu |
      
      
      