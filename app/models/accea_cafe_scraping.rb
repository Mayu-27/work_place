
module AcceaCafeScraping 
  require 'selenium-webdriver'

  def set_accea_cafes 
    driver = Selenium::WebDriver.for :chrome
    driver.navigate.to "http://cafe.accea.co.jp/#access"

    names = driver.find_elements(:class, 'si__shopName')

    shop_list = []

    names.first(3).each do |name|
      shop_list << name.text
    end

    url = []
    address_list = []

    3.times do |n|
      element = driver.find_element(:xpath ,"//*[@id='access']/div/div/ul/li[#{n+1}]/a").attribute('href')
      url << element
    end

    url.each do |u|
      driver.navigate.to u
      shop_address = driver.find_element(:class ,"mb20").text  
      address_list << shop_address
    end

    data = shop_list.zip(address_list).to_h
    shop_names = data.keys
  
    shop_names.each do |shop_name|
      spot = Spot.where(shop_name: shop_name).first_or_initialize
      spot.shop_name = shop_name
      spot.address = data[shop_name]
      spot.save
    end
  end
end




