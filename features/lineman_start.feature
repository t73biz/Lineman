Feature: To be able to load Lineman

  As a user
  I want to start using lineman
  So that I can create a Rails skeleton app

  Scenario Outline: Start Lineman
    Given I start the app with <args>
    Then lineman <expect> fail
    
  Scenarios: Start
    | args                      | expect     |
    | /home/ronald/work/yourapp | should_not |
    | -t                        | should     |
    | -h                        | should_not |
    | --help                    | should_not |
    | -q                        | should_not |
    | --quiet                   | should_not |
    | -V                        | should_not |
    | --verbose                 | should_not |
    | -v                        | should_not |
    | --version                 | should_not |
    | usage                     | should     |

