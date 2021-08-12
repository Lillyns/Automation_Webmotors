require "capybara/cucumber"
require "cucumber"
require "erb"
require "pry"
require "rspec"
require "selenium-webdriver"

EL     = YAML.load_file('./environments/elm.yml')
DATA   = YAML.load_file('./environments/data.yml')

case ENV["BROWSER"]
when 'selenium_novo'
  Capybara.register_driver :selenium_v4 do |app|
    chrome_options = Selenium::WebDriver::Chrome::Options.new.tap do |options|
      %w(
        --autoplay-policy=user-gesture-required
        --disable-background-networking
        --disable-background-timer-throttling
        --disable-backgrounding-occluded-windows
        --disable-breakpad
        --disable-client-side-phishing-detection
        --disable-component-update
        --disable-default-apps
        --disable-dev-shm-usage
        --disable-domain-reliability
        --disable-extensions
        --disable-features=AudioServiceOutOfProcess,IsolateOrigins,site-per-process
        --disable-hang-monitor
        --disable-ipc-flooding-protection
        --disable-offer-store-unmasked-wallet-cards
        --disable-popup-blocking
        --disable-print-preview
        --enable-gpu
        --disable-prompt-on-repost
        --disable-renderer-backgrounding
        --disable-setuid-sandbox
        --disable-speech-api
        --disable-sync
        --disable-web-security
        --disk-cache-size=33554432
        --hide-scrollbars
        --ignore-gpu-blocklist
        --metrics-recording-only
        --mute-audio
        --no-default-browser-check
        --no-first-run
        --no-pings
        --no-sandbox
        --no-zygote
        --password-store=basic
        --use-gl=swiftshader
        --use-mock-keychain
        --window-size=1920,1080
        --single-process
        --headless
      ).each {|switch| options.add_argument(switch)}
  
    end
  
    chromedriver_options = ::Selenium::WebDriver::Service.chrome(
      args: {
        verbose: false,
        whitelisted_ips: "",
      }
    )
  
    Capybara::Selenium::Driver.new(
      app, 
      browser: :chrome, 
      options: chrome_options,
      service: chromedriver_options,
    )
  end
  @driver = :selenium_v4

when 'selenium_novo_tela'
  Capybara.register_driver :selenium_v4 do |app|
    chrome_options = Selenium::WebDriver::Chrome::Options.new.tap do |options|
      %w(
   
        --disable-print-preview
        --window-size=1366,768
      ).each {|switch| options.add_argument(switch)}

    end
  
    chromedriver_options = ::Selenium::WebDriver::Service.chrome(
      args: {
        verbose: false,
        whitelisted_ips: "",
      }
    )
  
    Capybara::Selenium::Driver.new(
      app, 
      browser: :chrome, 
      options: chrome_options,
      service: chromedriver_options,
    )
  end
  @driver = :selenium_v4
  
end

Capybara.configure do |config|
  config.default_driver = @driver
  config.default_max_wait_time = 15
  config.default_selector = :xpath
  config.app_host = DATA["base_url"]
end