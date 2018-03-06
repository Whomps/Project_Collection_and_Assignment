require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
 
 When(/^I click "([^\"]*)"$/) do |link|
 	click_link(link)
 end
 
 Then(/^I should visit (.+)$/) do |page_name|
 	visit path_to(page_name)
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

Given (/^a valid user$/) do
  @user = User.create!({
             :email => "admin@example.com",
             :password => "adminadmin"
           })
end

Given(/^I fill in the details:$/) do |table2|
  fill_in "Email", :with => "master@example.com"
  fill_in "Password", :with => "adminadmin"
end

Given(/^I fill in the following details:$/) do |table1|
  fill_in "Name", :with => "admin"
  fill_in "UIN", :with => "123456789"
  fill_in "Email", :with => "karthi@karthik.com"
  fill_in "Password", :with => "karthi123"
  fill_in "Confirmation", :with => "karthi123"
  select('Fall', :from => 'Semester' )
  select('2016', :from => 'Year' )
  select('CSCE606', :from => 'Course' )
end

Given(/^I fill the mail id:$/) do |table2|
  fill_in "Email", :with => "master@example.com"
end

Given(/^I am logged in as "([^"]*)"$/) do |arg1|
    visit path_to('home_page')
    fill_in "Email", :with => "admin@example.com"
    fill_in "Password", :with => "adminadmin"
    #click_button ('Log in')
end

When(/^I fill the teamm name:$/) do |table|
  fill_in "Name", :with => "Karthikkkkk"
end

Then(/^I fill the updated details:$/) do |table|
  fill_in "Name", :with => "karthi"
  fill_in "Email", :with => "karthi@karthik.com"
  fill_in "Password", :with => "karth123"
  fill_in "Confirmation", :with => "karth123"
end


