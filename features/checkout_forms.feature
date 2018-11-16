Feature: Completing the checkout forms

  Background:
    Given I am on the site home page

  Scenario:
    Given I am on the site services page
    When I fill the form and submit. Data: "test", "e.bezhuraedgar@gmail.com"
