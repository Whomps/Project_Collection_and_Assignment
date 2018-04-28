require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
  
 When(/^I click "([^\"]*)"$/) do |link|
    click_link(link)
 end
 
 # This doesn't test anything
 Then(/^I should visit (.+)$/) do |page_name|
 	visit path_to(page_name)
 end
 
 Then(/^I should be on (.+)$/) do |page_name|
  current_path = URI.parse(current_url).path
    if current_path.respond_to? :should
      current_path.should == path_to(page_name)
    else
      assert_equal path_to(page_name), current_path
    end
  end
 
 Given(/^I am on (.+)$/) do |page_name|
 	visit path_to(page_name)
 end
 
 Then(/^I should see "([^\"]*)"$/) do |text|
 	page.should have_content(text)
 end

When(/^I press "([^"]*)"$/) do |arg1|
  click_button (arg1)
end

Given (/^a valid user$/) do |table|
  data = table.rows_hash
  @user = User.create!({
             :email => data['Email'],
             :password => data['Password']
           })
end

Given(/^I fill in the details:$/) do |table|
  data = table.rows_hash
  fill_in "Email", :with => data['Email']
  fill_in "Password", :with => data['Password']
end

Given(/^I fill in the following details:$/) do |table|
  data = table.rows_hash
  fill_in "Name", :with => data['Name']
  fill_in "UIN", :with => data['UIN']
  fill_in "Email", :with => data['Email']
  fill_in "Password", :with => data['Password']
  fill_in "Confirmation", :with => data['Confirmation']
  select data['Semester'], :from => 'Semester'
  select data['Year'], :from => 'Year'
  select data['Course'], :from => 'Course'
  
end
Given(/^I fill in the following project details:$/) do |table|
  data = table.rows_hash
  fill_in "Title", :with => data['Title']
  fill_in "Organization", :with => data['Organization']
  fill_in "Contact", :with => data['Contact']
  select data['Semester'], :from => 'Semester'
  select data['Year'], :from => 'Year'
  fill_in "Description", :with => data['Description']
  fill_in "Github link", :with => data['Github link']
  fill_in "Heroku link", :with => data['Heroku link']
  fill_in "Pivotal link", :with => data['Pivotal link']
end
  
Given(/^I fill the mail id:$/) do |table|
  data = table.rows_hash
  fill_in "Email", :with => data['Email']
end

Given(/^I am logged in as:$/) do |table|
  visit path_to('home_page')
  data = table.rows_hash
  fill_in "Email", :with => data['Email']
  fill_in "Password", :with => data['Password']
  #click_button ('Log in')
end

When(/^I fill the team name:$/) do |table|
  data = table.rows_hash
  fill_in "Name", :with => data['Name']
end

Then(/^I fill the updated details:$/) do |table|
  data = table.rows_hash
  fill_in "Name", :with => data['Name']
  fill_in "Email", :with => data['Email']
  fill_in "UIN", :with => data['UIN']
  fill_in "New Password", :with => data['New Password']
  fill_in "Confirm Password", :with => data['Confirm Password']
end