Feature: To be able to Select a Menu item and goto that subsection
  As a user
  I want to select a menu item
  So that I can work in that subsection
  
  Scenario Outline: Select Database Menu Item
    Given I am running lineman
    When I enter <input>
    Then I should see <output>


  Scenarios: Menu Items
    | input | output        |
    | D     | Database Menu |
    | G     | Gems Menu     |
    | M     | MVC Menu      |
    | P     | Plugins Menu  |
    | Q     | Quit Menu     |
