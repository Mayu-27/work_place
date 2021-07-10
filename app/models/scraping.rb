require 'nokogiri'
require 'open-uri'

class Scraping
  def self.set_table
    url = 'https://goworkship.com/magazine/tokyo-coworking-space/'
    doc = Nokogiri::HTML(open(url), nil, 'utf-8')
    tables = doc.css('table')

    tables.each do |table|
      save_table(table)
    end
  end

  def self.save_table(table)
    shop_name = table.css('tbody > tr[1] > td[2]')
    address = table.css('tbody > tr[2] > td[2]')
    access = table.css('tbody > tr[4] > td[2]')
    phone_number = table.css('tbody > tr[3] > td[2]')
    opening_hour = table.css('tbody > tr[5] > td[2]')

    spot = Spot.where(shop_name: shop_name.text).first_or_initialize
    spot.address = address.text
    spot.access = access.text
    spot.phone_number = phone_number.text
    spot.opening_hours = opening_hour.text
    spot.save
  end
end
