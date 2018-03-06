#@home_pagemainfeature
Feature: Homepage

	Scenario: See About Page
		Given I am on home_page
		When I click "About"
		Then I should visit the about page
		
#Feature: Contact

#@home_pageone
	Scenario: See Contact Page
		Given I am on the contact page
		Then I should see "walker@cse.tamu.edu"		
		
#Feature: Help

	Scenario: See Help Page
		Given I am on home_page
		When I click "Help"
		Then I should visit the help page
		
#Feature: Login

        Scenario: See Login Page
                Given I am on home_page
                When I click "Log In "
                Then I should visit the login page
                
        Scenario: See Login Page
                Given I am on home_page
                When I click "Log In with NetID"
                Then I should visit the login_netid page   
                
#Feature: Sign Up

	Scenario: See Sign Up Page
		Given I am on home_page
		When I click "Sign Up"
		Then I should visit the signup page     
		
		
	#Scenario: Github code
	  #Given I am on home_page
	  #Then I should see "Source code available at GitHub"
	  #When I click on the "GitHub"
	  #Then I should visit "https://github.com/rubythons/Project-Collection-and-Assignment"