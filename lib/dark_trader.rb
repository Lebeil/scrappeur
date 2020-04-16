require 'nokogiri'
require 'open-uri'

def dark_trader
    page = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all'))
    # page.title

    coins = []
    prices = [] 

    begin
        page.xpath('//*[@id="__next"]/div/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr/td[3]').each do |tr|
            coins << tr.text
        end
    rescue => e
        puts "Oups petite erreur, mais c'est pas grave"
    end

    begin
        page.xpath('//*[@id="__next"]/div/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr/td[5]').each do |tr|
            prices << tr.text
        end
    rescue => e
        puts "Oups petite erreur, mais c'est pas grave"
    end
    
    puts a = Hash[coins.zip(prices)]
end

dark_trader


