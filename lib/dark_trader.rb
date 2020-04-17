require 'nokogiri'
require 'open-uri'

#page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))  

#puts page.css('title').text

#Scrapping name
def coins
    page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))  
    name_array = Array.new
    (0..200).each do |x|
        name_array << page.xpath("//table/tbody/tr[#{x}]/td[3]").text
    end    
    return name_array
end


#Scrapping price
def prices
    page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))  
    price_array = Array.new
    (0..200).each do |x|
        price_array << page.xpath("//table/tbody/tr[#{x}]/td[5]").text
    end
    return price_array
end

#without $
def clean_price(arr)
    arr.each do |i|
        i.delete!('$').to_f
    end
end


#Create hash
def final_array(names,prices)
    crypto_array = Array.new
    names.each do |n|
        if n != ""
            hash = Hash.new
            hash[n] = prices[names.find_index(n)]
            crypto_array << hash
        end
    end
    return crypto_array
end

crypto_name_array = coins
crypto_price_array = prices
clean_price(crypto_price_array)
puts final_array(crypto_name_array,crypto_price_array)


# ---------------- autre méthode -------------------#

# def dark_trader
#     page = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all'))
#     # page.title

#     coins = []
#     prices = [] 

#     begin
#         page.xpath('//*[@id="__next"]/div/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr/td[3]').each do |tr|
#             coins << tr.text
#         end
#     rescue => e
#         puts "Oups petite erreur, mais c'est pas grave"
#     end

#     begin
#         page.xpath('//*[@id="__next"]/div/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr/td[5]').each do |tr|
#             prices << tr.text
#         end
#     rescue => e
#         puts "Oups petite erreur, mais c'est pas grave"
#     end
    
#     puts a = Hash[coins.zip(prices)]
# end

# dark_trader
