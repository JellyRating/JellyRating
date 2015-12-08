Feature: list all items
  As a user,
  So I can see the item information
  I want to list all the items

Background: item have been added to database
  Given the following item exist:
  | title                   | release_date |
  | Aladdin                 | 25-Nov-1992  |
  | The Terminator          | 26-Oct-1984  |
  | When Harry Met Sally    | 21-Jul-1989  |
  | The Help                | 10-Aug-2011  |
  And I am on "the homepage"

Scenario: list all items
  When I follow "Items"
  Then I should see "Aladdin"
  And I should see "The Terminator"
  And I should see "When Harry Met Sally"
  And I should see "The Help"

Scenario: search items by title
  When I follow "Items"
  And I fill in "search" with "in"
  And I press "Find"
  Then I should see "Aladdin"
  And I should see "The Terminator"
  And I should not see "The Help"
