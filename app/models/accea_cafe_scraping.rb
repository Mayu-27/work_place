module AcceaCafeScraping
  require 'selenium-webdriver'

  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('--headless')
  options.add_argument('--disable-gpu')
  options.add_argument("--disable-dev-shm-usage"); 
  options.add_argument('--no-sandbox')
  options.add_argument("--remote-debugging-port=9222") 

  def set_accea_cafes
    driver = Selenium::WebDriver.for :chrome, options: options

    driver.navigate.to 'http://cafe.accea.co.jp/#access'

    names = driver.find_elements(:class, 'si__shopName')

    shop_list = []

    names.first(3).each do |name|
      shop_list << name.text
    end

    url = []
    address_list = []
    phone_number_list = []

    3.times do |n|
      element = driver.find_element(:xpath, "//*[@id='access']/div/div/ul/li[#{n + 1}]/a").attribute('href')
      url << element
    end

    url.each do |u|
      driver.navigate.to u
      shop_address = driver.find_element(:class, 'mb20').text
      phone_number = driver.find_element(:class, 'storeInfo_td').text
      address_list << shop_address
      # phone_number_list << phone_number
    end

    data = shop_list.zip(address_list).to_h
    shop_names = data.keys

    shop_names.each do |shop_name|
      spot = Spot.where(shop_name: shop_name).first_or_initialize
      spot.shop_name = shop_name
      spot.address = data[shop_name]
      # spot.phone_number = data[]
      spot.save
    end
  end
end
