	require 'rubygems'
	require 'open-uri'
	require 'nokogiri'


def get_all_the_urls_of_val_doise_townhalls
	url_townhall = []
	array_noms = []

	doc = Nokogiri::HTML(open('http://annuaire-des-mairies.com/val-d-oise.html')).css('.lientxt').each do |town|
	rectify = town['href'].reverse!.chop.chop.reverse!
	new_string = "http://annuaire-des-mairies.com/#{rectify}"

	url_townhall << new_string
	array_noms << rectify
	end

array_noms_final = []

	array_noms.each do |nom|
		nouveau_nom = nom.chop.chop.chop.chop.chop.reverse!.chop.chop.chop.reverse!
		nouveau_nom
		array_noms_final << nouveau_nom
	end

 array_urls_noms = []
 array_urls_noms << url_townhall 
 array_urls_noms << array_noms_final
 array_urls_noms
end


def get_the_email_of_a_townhal_from_its_webpage(urls)
	array_emails = []

	urls[0].each do |url|
	  doc = Nokogiri::HTML(open(url))
	  a = doc.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]").text
	  array_emails << doc.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]").text
	end
	array_emails

	puts Hash[urls[1].zip(array_emails)]
end


b = get_all_the_urls_of_val_doise_townhalls
puts get_the_email_of_a_townhal_from_its_webpage(b).inspect



