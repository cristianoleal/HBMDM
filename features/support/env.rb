require "capybara"
require "capybara/cucumber"
require "selenium-webdriver"
require "os"

CONFIG = YAML.load_file(File.join(Dir.pwd, "features/support/config/#{CONFIG = ENV["ENV_TYPE"]}.yaml"))

case ENV["BROWSER"]
when "firefox"
  @driver = :selenium
when "chrome"
  @driver = :selenium_chrome
when "headless"
  Capybara.register_driver :selenium_chrome_headless do |app|
    chrome_options = Selenium::WebDriver::Chrome::Options.new.tap do |options|
      options.add_arguments "--headless"
      options.add_arguments "--disable-gpu"
      options.add_arguments "--no-sandbox"
      options.add_arguments "--disable-site-isolation-trials"
    end
    Capybara::Selenium::Driver.new(app, browser: :chrome, options: chrome_options)
  end
  @driver = :selenium_chrome_headless
else
  log "Browser inválido"
end

Capybara.configure do |config|
  config.default_driver = @driver
  config.app_host = CONFIG["url"]
  config.default_max_wait_time = 10
end