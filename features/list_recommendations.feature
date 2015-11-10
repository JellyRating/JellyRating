Feature: list all recommendations
  As a user,
  So I can see the recommendations information
  I want to list all recommendations

Background: recommendaitons have been added to database
  Given the following item exist:
  | title                   | release_date |
  | Aladdin                 | 25-Nov-1992  |
  | The Terminator          | 26-Oct-1984  |
  | When Harry Met Sally    | 21-Jul-1989  |
  | The Help                | 10-Aug-2011  |

  And the following user exist:
  | name  | email             | password  | password_confirmation |
  | John  | john@johnson.com  | 123456    | 123456                |  

  And the following recommendation exist:
  | item1     | item2           | user_email        |
  | Aladdin   | The Terminator  | john@johnson.com  |
  | The Help  | Aladdin         | john@johnson.com  |

  And I am on "the homepage"

Scenario: list all recommendations
  When I follow "Recommendations"
  Then I should see "Aladdin", "The Terminator" recommendation
  And I should see "The Help", "Aladdin" recommendation
  And I should not see "The Help", "The Terminator" recommendation
