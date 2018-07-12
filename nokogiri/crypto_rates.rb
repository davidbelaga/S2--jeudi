	require 'rubygems'
	require 'open-uri'
	require 'nokogiri'

def crypto_rates

currency_name = []
# i scrap all the names of the cryptocurrencies
doc = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/')).css('.currency-name-container').each do |item|
	currency = item.text
	currency_name << currency
end

currency_price = []
# all the values of the cryotocurrencies
doc = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/')).css('.price').each do |itm|
	price = itm.text
	currency_price << price
end

puts Hash[currency_name.zip(currency_price)]

end

crypto_rates
