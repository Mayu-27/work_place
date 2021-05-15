require 'nokogiri'
require 'open-uri'

class Scraping

  def self.set_table
    url = "https://goworkship.com/magazine/tokyo-coworking-space/"
    doc = Nokogiri::HTML(open(url),nil,"utf-8")
    tables = doc.css("table")

    # # 店舗名取得
    # tables.each do | table |          
    #   shop_name = table.css('tbody > tr[1] > td[2]')
    #   name_list << shop_name.text 
    # end

    # # 住所取得
    # tables.each do | table |          
    #   shop_address = table.css('tbody > tr[2] > td[2]')
    #   address_list << shop_address.text
    # end

    # # 電話番号取得
    # tables.each do | table |          
    #   phone_number = table.css('tbody > tr[3] > td[2]')
    #   phone_number_list << phone_number.text
    # end

    # # アクセス取得
    # tables.each do | table |          
    #   access = table.css('tbody > tr[4] > td[2]')
    #   access_list << access.text
    # end

    # # 営業時間取得
    # tables.each do | table |          
    #   opening_hour = table.css('tbody > tr[5] > td[2]')
    #   opening_hour_list << opening_hour.text
    # end

    tables.each do | table |
      get_table(table)
    end
  end


  def self.get_table(table)
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






# require 'mechanize'

# class Scraping
#   def self.fuga_urls
#     agent = Mechanize.new
#     links = []
#     next_url = ""

#     while true
#       current_page = agent.get("https://hoge.com/fuga/" + next_url)
#       elements = current_page.search('.fuga-title a')
#       elements.each do |ele|
#         links << ele.get_attribute('href')
#       end

#       next_link = current_page.at('.pagination .next a')
#       break unless next_link
#       next_url = next_link.get_attribute('href')
#     end

#     links.each do |link|
#       get_book('https://hoge.com/fuga' + link)
#     end
#   end

#   def self.get_book(link)
#     agent = Mechanize.new
#     page = agent.get(link)

#     # 今回はタイトル(title)と、画像(image_url)と、詳細(detail)をデータベースに保存したいとする
#     # if文は条件がnilまたはfalseの時のみfalseとなる
#     # よって、ifを利用することで情報が存在しない時でもエラーが発生しないようにできる
#     title = page.at('.fuga-title').inner_text if page.at('.fuga-title')
#     image_url = page.at('.fuga-content img')[:src] if page.at('.fuga-content img')
#     detail = page.at('.fuga-content p').inner_text if page.at('.fuga-content p')

#     # first_or_initializeメソッドでbooksテーブルのタイトルカラムに特定のタイトルが存在しなければ新たにインスタンスを作成する
#     book = Book.where(title: title).first_or_initialize
#     book.image_url = image_url
#     book.detail = detail
#     # インスタンスのカラムに値を代入後をレコードとして保存
#     book.save
#   end
# end

  


