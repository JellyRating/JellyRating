Feature: create a new item
  As a user,
  So I can make a recommendation with this item
  I want to add a item

Background: user has been added to database and loged in
  And the following user exist:
  | name  | email             | password  | password_confirmation |
  | John  | john@johnson.com  | 123456    | 123456                |

  And I am logged in as "john@johnson.com", "123456"
  And I am on "the homepage"

Scenario: create a new item
  When I follow "Add Item"
  And I fill in "Title" with "Aladdin"
  And I select "1992" from "item_release_date_1i"
  And I press "Add Item"
  Then I should see "Aladdin (1992)"

Scenario: don't create a new item
  When I follow "Add Item"
  And I press "Add Item"
  Then I should see "Title can't be blank"
