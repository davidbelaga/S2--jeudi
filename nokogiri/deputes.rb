require 'rubygems'
require 'nokogiri'
require 'open-uri'

def get_the_email_of_a_depute
  page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA605036"))
  text = page.xpath('/html/body/div[3]/div/div/div/section[1]/div/article/div[3]/div/dl/dd[4]/ul/li/a')[0]['href']
  email = text.split(":")[1]
  puts email
end

def get_all_the_urls_of_deputes
  page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
  page.xpath('//option').each do |depute|
    adresse = "www2.assemblee-nationale.fr" + depute['value'] if depute['value'] != ""
    puts adresse
  end
end

def get_all_emails_of_deputes
  hash_deputes = Hash.new("")
  listes_deputes = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
  listes_deputes.xpath('//option').each do |depute|
    if depute['value'] != ""
      adresse = "http://www2.assemblee-nationale.fr"
      adresse += depute['value']
      nom_prenom = depute.text.split
      nom = nom_prenom[2]
      prenom = nom_prenom[1]
      page_depute = Nokogiri::HTML(open(adresse))
      email = page_depute.xpath('//dd/ul/li/a')[1]['href'].split(":")[1]
      hash_depute = { nom: nom, prenom: prenom, email: email}
      hash_deputes[nom] = hash_depute
      puts hash_depute
    end
  end
end

def perform
  #get_the_email_of_a_depute
  #get_all_the_urls_of_deputes
  get_all_emails_of_deputes
end

perform