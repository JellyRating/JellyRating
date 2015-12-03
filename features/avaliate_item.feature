Feature: avaliate a item
  So others users can know if I like the item
  I want to rate a movie

Background: item have been added to database
  Given the following item exist:
  | title                   | release_date |
  | Aladdin                 | 25-Nov-1992  |

  And the following user exist:
  | name  | email             | password  | password_confirmation |
  | John  | john@johnson.com  | 123456    | 123456                |  

  And I am logged in as "john@johnson.com", "123456" 
  And I am on the "Aladdin" item page

Scenario: like the item
  When I follow "0 people liked" 
  Then I should see "1 person liked"
  And I should see "0 people disliked"


Scenario: like the item
  When I follow "0 people disliked" 
  Then I should see "1 person disliked"
  And I should see "0 people liked"

Scenario: not logged in avaliation
  When I follow "Log Out"
  And I am on the "Aladdin" item page
  And I follow "0 people liked"
  And I fill in the following:
  | Email          | john@johnson.com  |
  | Password       | 123456            |
  And I press "Log in"
  Then I should see "1 person liked"
  Then I should see "0 people disliked"
