require 'rubygems'
require 'nokogiri'
require 'open-uri'

@arr_url = []
@arr_townhal = []
@arr_mail = []
@townhal_mail = []

def get_the_email_of_a_townhal_from_its_webpage(url)
  page_townhal(url)
end

def get_all_the_urls_of_val_doise_townhalls(url, url2)
  url_townhal(url, url2)
  townhal_mail
  puts @townhal_mail
end

def url_townhal(url, url2)
  page = Nokogiri::HTML(open("#{url2}"))
  page.xpath('//a[@class = "lientxt"]').each do |node|
    a = node.values
    b = node.text
    @arr_townhal << b
    url_full = a[1].delete_prefix('.')
    url_full = url + url_full
    page_townhal(url_full)
    @arr_url << url_full
  end
end

def page_townhal(url)
  c =[]
  begin
    page3 = Nokogiri::HTML(open("#{url}"))
    page3.xpath('//td').each do |node|
      c << node.text
    end
    @arr_mail << c[7]
  rescue
puts 'erreur'
  end
end

def townhal_mail
  size = @arr_mail.size - 1
  for i in 0..size
    @townhal_mail[i] = {"name" => @arr_townhal[i], "email" => @arr_mail[i]}
  end
end

puts get_the_email_of_a_townhal_from_its_webpage('http://www.annuaire-des-mairies.com/95/vaureal.html')
puts get_all_the_urls_of_val_doise_townhalls('http://annuaire-des-mairies.com','http://annuaire-des-mairies.com/val-d-oise.html')
