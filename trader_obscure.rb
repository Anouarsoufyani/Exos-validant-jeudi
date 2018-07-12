require 'rubygems'
require 'nokogiri'
require 'open-uri'


# NOTE: un programme qui va récupérer le cours de toutes les cryptomonnaies, et les enregistrer bien proprement dans une array de hashs.

# méthode globales
def stock_market_price
    c = price
    d = monnaie_name
    array_to_hash(d,c)
end
# méthode pour récupérer le cour de la monnaie
def price
    c = []
    page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all"))
    page.xpath('//a[@class = "price"]').each do |node|
        c << node.text
    end
    c
end
# méthode pour récupérer le nom de la monnaie
def monnaie_name
    d = []
    page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all"))
    page.xpath('//a[@class = "currency-name-container link-secondary"]').each do |node|
        d << node.text
    end
    d
end
# méthode pour obtenir un hash

def array_to_hash(d, c)
    my_hash = d.zip(c)
    puts my_hash.to_h
end

# affichage du hash
puts stock_market_price
