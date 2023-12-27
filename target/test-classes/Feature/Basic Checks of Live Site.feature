@healthCheck
Feature: E-Commerce website healthcheck

  Background: Navigation to the URL
    Given User navigate to URL and open the landing page

  @URLRedirection
  Scenario: User naviaget to URL, User redirect to landing page with expected current URL
    When User is on landing page
    Then Validate current URL of landing page with expected URL

  @HomePageHeaderLinks
  Scenario: Validate Header links
    When User validate all headerlink are clickable or not
    Then Below header Links are displayed
      | Order Tracking   |
      | Candere logo     |
      | Find Store       |
      | Contact Us       |
      | Blog             |
      | User             |
      | Wishlist         |
      | Bag              |
      | search text box  |
      | Refer a Friend   |
      | Buy Digital Gold |
      
      
  