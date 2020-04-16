require 'nokogiri'
require 'open-uri'


def get_townhall_email(townhall_url)
  my_hash = {}
  a = []
  townhall_url.each do |url|
    page = Nokogiri::HTML(URI.open(url)) 

    ville = page.xpath("/html/body/div[1]/main/section[1]/div/div/div/h1").text
    email = page.xpath("/html/body/div[1]/main/section[2]/div/table/tbody/tr[4]/td[2]").text
    a << my_hash[ville] = email
  end

  return a
end

def get_townhall_urls
  page = Nokogiri::HTML(URI.open("http://www.annuaire-des-mairies.com/val-d-oise.html"))

  ville = []
  page.xpath('//a[contains(@href, "95")]').each do |element|
    ville << "https://www.annuaire-des-mairies.com/" + element.attributes["href"].value.gsub('./', '/')
  end

  return ville
end


puts get_townhall_email(get_townhall_urls)



