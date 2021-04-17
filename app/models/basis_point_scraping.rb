class BasisPointScraping < ApplicationRecord
  driver = Selenium::WebDriver.for :chrome
  driver.navigate.to 'https://basispoint.tokyo/store/'

  shop_list = []
  address_list = []
  url = []

  num = 1

  6.times do
    shop = driver.find_element(:xpath, "//*[@id='coworkingPoint']/div[2]/div[1]/ul[1]/li[#{num}]")
    element = driver.find_element(:xpath, "//*[@id='coworkingPoint']/div[2]/div[1]/ul[1]/li[#{num}]/a").attribute('href')

    num += 1
    shop_list << shop.text
    url << element
  end

  url.each do |u|
    driver.navigate.to u
    address = driver.find_element(:class, 'headline3Caption')
    address_list << address.text
  end

  driver.quit

  shop_list.each do |shop_name|
    spot = Spot.new
    spot.name = shop_name.text

    spot.save
  end
end
