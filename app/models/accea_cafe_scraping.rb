class AcceaCafeScraping <   

require 'selenium-webdriver'

driver = Selenium::WebDriver.for :chrome
driver.navigate.to "http://cafe.accea.co.jp/#access"

names = driver.find_elements(:class, 'si__shopName')

shop_list = []

names.each do |name|
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


spot = Spot.new
address_list.each do |address|
  spot.address = address
end

shop_list.each do |shop_name|
  spot.shop_name = shop_name
end

spot.save

end