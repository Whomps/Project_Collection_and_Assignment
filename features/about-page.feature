Feature: About page

    Scenario: View About page
      Given I am on the home_page
      When I click "About"
      Then I should see "This app is designed for the allotment of projects"
      And I should see "until December 2016"
      And I should see "between January 2017 and May 2017"
      And I should see "between January 2018 and May 2018"
      And I should see "latest Agile project management history"