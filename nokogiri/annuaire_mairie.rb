
	require 'rubygems'
	require 'open-uri'
	require 'nokogiri'



def get_the_email_of_a_townhal_from_its_webpage

doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/95/vaureal.html"))
puts doc.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]").text


end

puts get_the_email_of_a_townhal_from_its_webpage