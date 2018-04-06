#@home_pagemainfeature
Feature: Homepage

	Scenario: See About Page
		Given I am on home_page
		When I click "About"
		Then I should visit the about page

	Scenario: See Contact Page
		Given I am on the contact page
		Then I should see "walker@cse.tamu.edu"		

	Scenario: See Help Page
		Given I am on home_page
		When I click "Help"
		Then I should visit the help page

    Scenario: See Login Page
        Given I am on about_page
        When I click "Log In"
        Then I should see "Log in"
           
    Scenario: See Login Page
        Given I am on home_page
        When I click "Log In (NetID)"
        Then I should see "Log in (NetID)"

	Scenario: See Sign Up Page
		Given I am on home_page
		When I click "Sign Up"
		Then I should visit the signup page     
		
	Scenario: Github code
	  Given I am on home_page
	  Then I should see "Source code available at GitHub"