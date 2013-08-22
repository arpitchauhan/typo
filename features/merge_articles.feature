Feature: Merge Articles
	As an admin
	In order to merge two articles
	I want to merge two articles

	Scenario: Supplying the other article's ID
	Given the blog is set up
	And I am logged into the admin panel
	And I visit edit_post_1
	Then I should see "Uploads"
	And I should see "Tags"
	And I should see "Excerpts"
	And I should see "Merge Articles"

	#When I follow "Total posts"
	#Then I should see ""
	#When I follow "http://0.0.0.0:3000/iz5uQ0"
	