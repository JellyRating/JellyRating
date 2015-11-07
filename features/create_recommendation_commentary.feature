Feature: create a new commentary about a recommendation
  As a user,
  So that others users can see my opinion of the recommendation
  I want to post a new commentary about a specific recommendation

Background: item have been added to database
  Given the following item exist:
  | title                   | release_date |
  | Aladdin                 | 25-Nov-1992  |
  | The Terminator          | 26-Oct-1984  |

  And the following user exist:
  | name  | email             | password  | password_confirmation |
  | John  | john@johnson.com  | 123456    | 123456                |  

  And I am logged in as "john@johnson.com", "123456" 
  And the following recommendation exist:
  | item1   | item2           | user_email        |
  | Aladdin | The Terminator  | john@johnson.com  |
  And I am on the "Aladdin", "The Terminator" recommendation page


Scenario: create a new commentary about this recommendation
  When I follow "New Commentary"
  And I fill in "Comment" with "I like both movies"
  And I press "Post"
  Then I should see "John"
  And I should see "I like both movies" 
