Capybara.javascript_driver = :webkit

Capybara::Webkit.configure(&:block_unknown_urls)

Capybara.configure do |config|
  config.match = :prefer_exact
end
