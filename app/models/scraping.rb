class Scraping
  require 'nokogiri'
  require 'open-uri'

  def self.get_info
    url = "https://goworkship.com/magazine/tokyo-coworking-space/"
    doc = Nokogiri::HTML(open(url),nil,"utf-8")
    tables = doc.css("table")

    name_list = []
    address_list = []
    phone_number_list = []
    access_list = []
    opening_hour_list = []

    # 店舗名取得
    tables.each do | table |          
      shop_name = table.css('tbody > tr[1] > td[2]')
      name_list << shop_name.text 
    end

    # 住所取得
    tables.each do | table |          
      shop_address = table.css('tbody > tr[2] > td[2]')
      address_list << shop_address.text
    end

    # 電話番号取得
    tables.each do | table |          
      phone_number = table.css('tbody > tr[3] > td[2]')
      phone_number_list << phone_number.text
    end

    # アクセス取得
    tables.each do | table |          
      access = table.css('tbody > tr[4] > td[2]')
      access_list << access.text
    end

    # 営業時間取得
    tables.each do | table |          
      opening_hour = table.css('tbody > tr[5] > td[2]')
      opening_hour_list << opening_hour.text
    end


    name_list.each do |shop_name|
      # spot = Spot.where(shop_name: shop_name).first_or_initialize
      spot = Spot.new(shop_name: shop_name)
    
      # spot.shop_name = shop_name
      spot.save
    end

  end
end


  

# name_list.each do |name|
#   spot = Spot.where(shop_name: name).first_or_initialize
#   spot.shop_name = name
#   spot.save
# end

# address_list.each do |address|
#   spot = Spot.where(shop_address: address).first_or_initialize
#   spot.shop_address = address
#   spot.save
# end

# name_list.each do |name|
#   spot = Spot.where(shop_name: name).first_or_initialize
#   spot.shop_name = name
#   spot.save
# end

# name_list.each do |name|
#   spot = Spot.where(shop_name: name).first_or_initialize
#   spot.shop_name = name
  
#   spot.save
# end



