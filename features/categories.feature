Feature: See Categories
  As an author
  In order to see the categories of an article
  I want to see categories

  Scenario: I click on categories in admin home
  Given the blog is set up
  And I am logged into the admin panel
  And I follow "Categories"
  Then I should see "Categories"
