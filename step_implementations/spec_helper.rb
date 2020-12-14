# frozen_string_literal: true

require 'capybara/dsl'
require 'capybara/rspec'
Bundler.require

Capybara.default_driver = :chrome

before_suite do
  Capybara.register_driver(:chrome) do |app|
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--headless')
    options.add_argument('--window-size=1400,1400')

    Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
  end
end

Gauge.configure do |config|
  config.include Capybara::DSL
  config.include RSpec::Matchers
  config.custom_screenshot_writer = -> {
    file = File.join(config.screenshot_dir, "screenshot-#{(Time.now.to_f*10000).to_i}.png")
    Capybara.page.save_screenshot(file)
    File.basename(file)
  }
end
