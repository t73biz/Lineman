Feature: To be able to load Lineman

  As a user
  I want to start using lineman
  So that I can create a Rails skeleton app
  
  Scenario: Start Lineman
    Given I am not yet running lineman
    When I start a new instance of lineman
    Then I should see "Welcome to Lineman"
    And I should see "Select from the menu"
    And I should see "D)atabase"
    And I should see "G)ems"
    And I should see "M)VC"
    And I should see "P)lugins"
    And I should see "Q)uit"

