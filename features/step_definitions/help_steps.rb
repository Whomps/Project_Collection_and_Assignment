require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
 
 When(/^I check "([^\"]*)"$/) do |link|
    check(link)
 end
  
 When(/^I click "([^\"]*)"$/) do |link|
    click_link(link)
 end
 
 When(/^I click ([\d]+)th "([^\"]*)"$/) do |n, link|
   #first(:link, link).click
    a = find_all(:link, link)[(n.to_i) - 1]
    a.click
  end
 
 When(/^I press ([\d]+)th "([^\"]*)"$/) do |n, link|
    a = find_all(:button, link, minimum: 1)[(n.to_i) -1]
    a.click
  end
  
 Then(/^I visit (.+)$/) do |page_name|
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
 
Then(/^I should not see "([^\"]*)"$/) do |text|
 	page.should not(have_content(text))
 end

When(/^I press "([^"]*)"$/) do |arg1|
  click_button (arg1)
end

When(/^I select "([^"]*)"$/) do |arg1|
  select arg1 
end

Given (/^a user$/) do |table|
  data = table.rows_hash
  @user = User.create!({
             :admin => false,
             :email => data['Email']? data['Email'] : 'user1@test.com',
             :name => data['Name']? data['Name'] : 'TestUser',
             :password => data['Password']? data['Password'] : 'password',
             :uin => data['UIN']? data['UIN'] : '111111111',
             :year => data['Year']? data['Year'] : '2018',
             :semester => data['Semester']? data['Semester'] : 'Spring',
             :course => data['Course']? data['Course'] : 'CSCE606'
           })
end

Given (/^an admin$/) do |table|
  data = table.rows_hash
  @user = User.create!({
             :admin => true,
             :email => data['Email']? data['Email'] : 'admin1@test.com',
             :name => data['Name']? data['Name'] : 'TestAdmin',
             :password => data['Password']? data['Password'] : 'password',
             :uin => data['UIN']? data['UIN'] : '123123123',
             :year => data['Year']? data['Year'] : '2018',
             :semester => data['Semester']? data['Semester'] : 'Spring',
             :course => data['Course']? data['Course'] : 'CSCE606'
           })
end

Given (/^there exists a project$/) do |table|
  data = table.rows_hash
  Project.create!({:title => data['Title']? data['Title'] : 'ProjectName',
             :organization => data['Organization']? data['Organization'] : "Org1",
             :contact => data['Contact']? data['Contact'] : "979-456-7890",
             :description => data['Description']? data['Description'] : "aaaa",
             :oncampus => data['OnCampus']? data['OnCampus'] : true,
             :islegacy => data['IsLegacy']? data['IsLegacy'] : false,
             :approved => data['Approved']? data['Approved'] : false,
             :semester => data['Semester']? data['Semester'] : "Spring",
             :year => data['Year']? data['Year'] : '2018',
             :github_link => data['Github']? data['Github'] : 'github',
             :heroku_link => data['Heroku']? data['Heroku'] : 'heroku',
             :pivotal_link => data['Pivotal']? data['Pivotal'] : 'pivotal'
           })
end

Given (/^there exists a team$/) do |table|
  data = table.rows_hash
  if data['User']
    @user = User.find_by_name(data['User'])
  end
  Team.create!({:name => data['Name']? data['Name'] : 'TeamName',
                :user_id => @user.id
              })
end

Given(/^I fill the peer evaluation:$/) do |table|
  data = table.rows_hash
  @user = User.find_by_name("UserAccount")
  fill_in "peer_evaluation_#{@user.id.to_s}.score", :with => data["Score"]
  fill_in "peer_evaluation_#{@user.id.to_s}.comment", :with => data["Comments"]
end

Given(/^I fill in the details:$/) do |table|
  data = table.rows_hash
  fill_in "Email", :with => data['Email']
  fill_in "Password", :with => data['Password']
end

Given(/^I fill in the following login details:$/) do |table|
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

Given(/^I fill the team name:$/) do |table|
  data = table.rows_hash
  fill_in "Name", :with => data['Name']
end

Given(/^I am logged in as:$/) do |table|
  visit path_to('home_page')
  click_link("Log In (Local)")
  data = table.rows_hash
  fill_in "Email", :with => data['Email']
  fill_in "Password", :with => data['Password']? data['Password'] : 'password'
  click_button ('Log In')
end

Then(/^I fill the updated details:$/) do |table|
  data = table.rows_hash
  fill_in "Name", :with => data['Name']
  fill_in "Email", :with => data['Email']
  fill_in "UIN", :with => data['UIN']
  fill_in "New Password", :with => data['New Password']
  fill_in "Confirm Password", :with => data['Confirm Password']
end

Given (/^I create a team$/) do |table|
  data = table.rows_hash
  visit path_to('home_page')
  click_link("Create Team")
  fill_in "Name", :with => data["Name"]
  click_button("Create Team")
  page.should have_content("Team created successfully")
end

Then(/^I fill the team code:$/) do |table|
  data = table.rows_hash
  fill_in "relationship_code", :with => data['Code'], visible: false
end