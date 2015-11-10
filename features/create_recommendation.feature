Feature: create a new recommendation
  As a user,
  So that others users can see my recommendation
  I want to recommend a item to other

Background: item have been added to database
  Given the following item exist:
  | title                   | release_date |
  | Aladdin                 | 25-Nov-1992  |
  | The Terminator          | 26-Oct-1984  |

  And the following user exist:
  | name  | email             | password  | password_confirmation |
  | John  | john@johnson.com  | 123456    | 123456                |  

  And I am logged in as "john@johnson.com", "123456" 
  And I am on "the homepage"

Scenario: create a new recommendation
  When I follow "Add Recommendation"
  And I select "Aladdin" from "item1"
  And I select "The Terminator" from "item2"
  And I press "Create Recommendation"
  Then I should see "New recommendation created"
  And I should see "Aladdin" 
  And I should see "The Terminator"
  And I should see "John"
  And I should not see "Chocolat"

Scenario: fail to create a new recommendation with blank items
  When I follow "Add Recommendation"
  And I press "Create Recommendation"
  Then I should see "Select a item"

Scenario: fail to create a new recommendation with same item
  When I follow "Add Recommendation"
  And I select "Aladdin" from "item1"
  And I select "Aladdin" from "item2"
  And I press "Create Recommendation"
  Then I should see "Item1 must be different from the other item"

Scenario: fail to create a new recommendation that already exits
  When I follow "Add Recommendation"
  And I select "Aladdin" from "item1"
  And I select "The Terminator" from "item2"
  And I press "Create Recommendation"
  And I follow "Add Recommendation"
  And I select "Aladdin" from "item1"
  And I select "The Terminator" from "item2"
  And I press "Create Recommendation"
  Then I should see "Recommendation have already been created"
  And I should see "Aladdin" 
