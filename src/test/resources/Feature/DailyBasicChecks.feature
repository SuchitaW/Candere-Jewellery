@healthCheck
Feature: E-Commerce website healthcheck

  Background: Navigation to the URL
    Given User navigate to URL and open the landing page

  @URLRedirection
  Scenario: User naviaget to URL, User redirect to landing page with expected current URL
    When User is on landing page
    Then Validate current URL of landing page with expected URL

  @SignUp
  Scenario Outline: HomePage- Sign Up with OTP
    When User see Your Account and click on  SignUp  from home page
    And User enters  "<name>"  and  "<emailid>" and "<mobileno>"
    And User click on Send Otp
    And User enter otp
    And Click on Verify Otp & Register
    Then User successfully redirected to "Online Jewellery Shopping India | Candere By Kalyan Jewellers | Most Trusted Online Jewellery Store"

    Examples: 
      | name     | emailid                 | mobileno   |
      | cucumber | 447867xdgg3@candere.com | 7906457645 |

  #| cucumber | testing3092@candere.com  | 8265656892 |
  #| cucumber | testing34522@candere.com | 8267110892 |
  #| cucumber | testing3792@candere.com  | 8267256892 |
  #| cucumber | testing3242@candere.com  | 8567256892 |
  @loginemailid
  Scenario Outline: HomePage- Login with Email Id -OTP
    When User see Your Account and click on  Log In  from home page
    And User enters "<Emailid or mobileno>"
    And User click on continue button
    And User enter otp manually and click on login
    Then User successfully redirected to homepage "Online Jewellery Shopping India | Candere By Kalyan Jewellers | Most Trusted Online Jewellery Store"

    Examples: 
      | Emailid or mobileno       |
      | suchita.tayde@candere.com |

  @loginmobileno
  Scenario Outline: HomePage- Login with Mobile no -OTP
    When User see Your Account and click on  Log In  from home page
    And User enters "<Emailid or mobileno>"
    And User click on continue button
    And User enter otp manually and click on login
    Then User successfully redirected to homepage "Online Jewellery Shopping India | Candere By Kalyan Jewellers | Most Trusted Online Jewellery Store"

    Examples: 
      | Emailid or mobileno |
      |          1234444444 |

  @LoginUsingGoogle
  Scenario: Login using Google Account
    When User see Your Account and click on  Log In  from home page
    And User click on Login Using Google
    And User enters Emailid or mobileno ,password and click on next button
    Then User successfully redirected to homepage

  @CheckoutSignup
  Scenario Outline: CheckoutPage- Sign Up with OTP
    When User search for the  "<product>"
    And choose to buy the first item in list
    And Add first product to the shopping cart
    And User click on Checkout Securely
    And User are able to see the signup and login popup and click on signup
    And User enters  "<name>"  and  "<emailid>" and "<mobileno>"
    And User click on Send Otp
    And User enter otp
    And Click on Verify Otp & Register
    And Shipping page is open then user fill all details "<lastname>"  and  "<mobile>" and "<zip>" and "<flat>"  and  click on continue
    And User see the payment page and click on UPI
    Then User enter "<UPIId>" and click on placeorder

    Examples: 
      | product  | name     | emailid                  | mobileno   | lastname | mobile     | zip    | flat                                   | UPIId              |
      | EARRINGS | selenium | d2566565ddgf@candere.com | 8456805731 | Peter    | 9023458934 | 400068 | flat no 201,sanlkalp chsl dahisar east | suchitatayde@oksbi |

  @CheckoutLoginemailid
  Scenario Outline: CheckOutPage- Login with Email Id -OTP
    When User search for the  "<product>"
    And choose to buy the first item in list
    And Add first product to the shopping cart
    And User click on Checkout Securely
    And User enters "<Emailidmobileno>"
    And User click on continue button
    And User enter otp manually and click on login
    And Click on SHIP TO SAME ADDRESS
    And Click on Add new
    And Fill all details "<lastname1>"  and  "<mobile1>" and "<zip1>" and "<flat1>"  and  click on continue
    And Select the payment method CreditDebit Card
    And User enter "<CardNumber>" and "<NameOnCard>"  and  "<CVV>"  and  "<ExpiryYear>"  and  "<ExpiryMonth>" click on placeorder
    And User see the cander razorpay page
    And User mouseover to my account and click on my order
    And Click on view details and scroll down
    Then Go back to my orders

    Examples: 
      | product | Emailidmobileno           | lastname1 | mobile1    | zip1   | flat1                                  | CardNumber          | NameOnCard | CVV | ExpiryYear | ExpiryMonth |
      | RINGS   | suchita.tayde@candere.com | Wadhe     | 9178458934 | 400068 | flat no 201,sanlkalp chsl dahisar east | 4111 1111 1111 1111 | testing    | 123 |         24 |          12 |

  @CheckoutLoginmobileno
  Scenario Outline: CheckOutPage-  Login with Mobile no -OTP
    When User search for the  "<product>"
    And choose to buy the first item in list
    And Add first product to the shopping cart
    And User click on Checkout Securely
    And User enters "<Emailidmobileno>"
    And User click on continue button
    And User enter otp manually and click on login
    And Click on SHIP TO NEARBY CANDERE/KALYAN STORE
    And User enter "<pincode>" and click on submit
    And User select the store address
    And User see the payment page and click on NetBanking
    And Select the bank as per there choice
    Then User click on place order and see the bank page

    Examples: 
      | product | Emailidmobileno | pincode |
      | Earring |      1234444444 |  400066 |

  @CheckoutLoginusinggoogle
  Scenario Outline: Checkout Login using Google
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
    And User select the payment method CreditDebit Card
    And User enter "<CardNumber>" and "<NameOnCard>"  and  "<CVV>"  and  "<ExpiryYear>"  and  "<ExpiryMonth>" click on placeorder
    And User see the cander razorpay page
    And User mouseover to my account and click on my order
    And Click on view details and scroll down
    Then Go back to my orders

    Examples: 
      | product1 | product  | CardNumber          | NameOnCard | CVV | ExpiryYear | ExpiryMonth |
      | Rings    | Earrings | 4111 1111 1111 1111 | testing    | 123 |         23 |          12 |

  @HomepageSignUp
  Scenario Outline: Order Journey (includes other pdp,plp and cart page functionalities ) till payment page functionality
    When User see Your Account and click on  SignUp  from home page
    And User enters  "<name>"  and  "<emailid>" and "<mobileno>"
    And User click on Send Otp
    And User enter otp
    And Click on Verify Otp & Register
    And User successfully redirected to "Online Jewellery Shopping India | Candere By Kalyan Jewellers | Most Trusted Online Jewellery Store"
    And User click on product type ring
    And choose to buy the first item in list
    And User select the ring size
    And User enters "<Pincode>" and click on Check button
    And User see the Expected Delivery Date
    #And User click on Price breakup link
    And User click on add to cart and see the cart page
    And On cart page user is able to change the product qty and and size
    And User click on Checkout Securely
    And Fill all details "<lastname1>"  and  "<mobile1>" and "<zip1>" and "<flat1>"  and  click on continue
    And User see the payment page and click on DGRP
    And Select the No. of installments in months
    And Clikc on accept DGRP Terms and Conditions and click on pay now
    And User select the payment method as UPI
    And User click on pay now
    And User mouseover to my account and click on my order
    And Click on view details and scroll down
    Then Go back to my orders

    Examples: 
      | Pincode | name         | emailid                  | mobileno   | lastname1 | mobile1    | zip1   | flat1                                  | UPIId         |  |
      |  400089 | javacucumber | fg6190323fds@candere.com | 9099518203 | More      | 9023458934 | 400066 | flat no 201,sanlkalp chsl dahisar east | anything@payu |  |
