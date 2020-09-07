require "capybara"
require "capybara/cucumber"
require "selenium-webdriver"
require "os"

Capybara.configure do |config|
  config.default_driver = :selenium_chrome_headless
  config.default_max_wait_time = 15
  config.app_host = "http://ambev.tracking2nd.com.br"
end