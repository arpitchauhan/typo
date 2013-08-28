Feature: Merge Articles
	As an admin
	In order to merge two articles
	I want to merge two articles

	Scenario: Checking that functionality to merge is present
	Given the blog is set up
	And I am logged into the admin panel
	And I visit edit_post_1
	Then I should see "Uploads"
	And I should see "Tags"
	And I should see "Excerpts"
	And I should see "Merge Articles"

	Scenario: Creating two new articles and merging them
	Given I have added two articles with comments
	And I open the first article as admin and merge it with the second one
	And I open the first article in show mode
	Then I should see body of earlier first and second articles inside first article	
	And I should see comments of earlier first and second articles inside first article 		
	And I should not see the second article in admin panel
    

	#Given the blog is set up
	#And I am logged into the admin panel
	#And I create an article with title "First Test Article" and body "First Test Article Body"
	#And I create an article with title "Second Test Article" and body "Second Test Article Body"
	#And I open the article with title "First Test Article" in show mode  
	#And I enter a comment
	#| comment_author |  comment_email | comment_url | comment_body |
	#| Test Commenter 1  | testcommenter1@gmail.com | http://testcomment1.com | This is test comment 1 |
	





	#When I follow "Total posts"
	#Then I should see ""
	#When I follow "http://0.0.0.0:3000/iz5uQ0"
	