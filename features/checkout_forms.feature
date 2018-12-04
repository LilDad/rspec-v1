Feature: Completing the checkout forms

  Background:
    Given I am on the site home page

  Scenario: test Quote form
    Given I am on the site services page
    When I fill the Quote form and submit. Data: "test", "e.bezhuraedgar@gmail.com"
    Then I send fill form

  Scenario: test Order form
    Given I am on the site order page
    When I fill the Order form and submit. Data: "test", "e.bezhuraedgar@gmail.com"