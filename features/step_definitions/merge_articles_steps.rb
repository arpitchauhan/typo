When /^I visit edit_post_1$/ do
  visit '/admin/content/edit/1'
end

first_test_article_title = "First Test Title"
second_test_article_title = "Second Test Title"
first_test_article_body = "First Test Article Body"
second_test_article_body = "Second Test Article Body" 

And /^I create an article with title "(.*)" and body "(.*)"$/ do |title, body|
  visit '/admin/content/new'
  
  if page.respond_to? :should
    page.should have_content('New Article')
  else
    assert page.has_content?('New Article')
  end

  fill_in 'article_title', :with => title
  fill_in 'article__body_and_extended_editor', :with => body
  click_button 'Publish'
  if page.respond_to? :should
    page.should have_content('Article was successfully created')
  else
    assert page.has_content?('Article was successfully created')
  end

end

And /^I open the article with title "(.*)" in show mode$/ do |title|
  visit '/'
  click_link title

end

And /^I open the first article in show mode$/ do
  steps %{ And I open the article with title "#{first_test_article_title}" in show mode }
end

Then /^I should see body of earlier first and second articles inside first article$/ do
  page.should have_content(first_test_article_body)
  page.should have_content(second_test_article_body)

end

And /^I should see comments of earlier first and second articles inside first article$/ do
  page.should have_content('Test Commenter 1')
  page.should have_content('This is test comment 1')
  page.should have_content('Test Commenter 2')
  page.should have_content('This is test comment 2')

end

And /^I enter a comment$/ do |comments_table| 
  
  fill_in 'comment_author', :with => comments_table.hashes[0]['comment_author']
  fill_in 'comment_email', :with => comments_table.hashes[0]['comment_email']
  fill_in 'comment_url', :with => comments_table.hashes[0]['comment_url']
  fill_in 'comment_body', :with => comments_table.hashes[0]['comment_body']
  click_button 'comment'
  page.should have_content(comments_table.hashes[0]['comment_author'])
  page.should have_content(comments_table.hashes[0]['comment_body'])
end

And /^I should not see the second article in admin panel$/ do
  visit '/admin/content'
  page.should_not have_link(second_test_article_title)
end

Given /^I have added two articles with comments$/ do
  steps %Q{
  Given the blog is set up
  And I am logged into the admin panel
  And I create an article with title "#{first_test_article_title}" and body "#{first_test_article_body}"
  And I create an article with title "#{second_test_article_title}" and body "#{second_test_article_body}"
  And I open the article with title "#{first_test_article_title}" in show mode  
  And I enter a comment
  | comment_author |  comment_email | comment_url | comment_body |
  | Test Commenter 1  | testcommenter1@gmail.com | http://testcomment1.com | This is test comment 1 |
  And I open the article with title "#{second_test_article_title}" in show mode
  And I enter a comment
  | comment_author |  comment_email | comment_url | comment_body |
  | Test Commenter 2  | testcommenter2@gmail.com | http://testcomment2.com | This is test comment 2 |

  }  
end

And /^I open the first article as admin and merge it with the second one$/ do
  visit '/admin'
  page.should have_content('Welcome back, admin!')
  visit '/admin/content'
  click_link "#{second_test_article_title}"
  second_article_id = current_path[-1]
  visit '/admin/content'
  click_link "#{first_test_article_title}"
  fill_in 'merge_with', :with => second_article_id
  click_button 'Merge'

end
