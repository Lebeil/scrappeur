require 'nokogiri'
require 'open-uri'


def recup_omc
	
	doc = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique")) 
	#L'adresse contenant la liste des noms et prenoms des deputes
	doc.css('//*[@id="deputes-list"]/div/ul/li/a').each do |node|
	#la cible xpath ou les noms se trouvent
	@dep_prenoms = node.text.sub("M.","").sub("Mme","").split(' ').slice(0)
	#une variable avec pour valeur le prenom du tour de la boucle sans le Mr/Mme
	@dep_noms = node.text.sub("M.","").sub("Mme","").split(' ').slice(1..3)
	#une variable identique pour le noms
	@OMC = node['href']
	#une variable pour le reste de l'adresse http pour atteindre 
	#la page des mail qui est utilise dans la methode "recup_mail"
	recup_mail(@OMC)
	#la methode recup mail est lance
	end
end


def recup_mail(x)



	array_prenom_noms = []
	dep_noms_array = []
	dep_prenoms_array = []
	@emails = []

	#4 array vides

	doc = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr"+x))
	#L'adresse contenant la liste des emails des deputes
	doc.xpath('//*[@id="haut-contenu-page"]/article/div[3]/div/dl/dd[4]/ul/li[1]/a').each do |node|
	#la cible xpath ou les emails se trouvent
	@emails << node['href'].sub("mailto:","")#EMAIL
	#un array avec pour valeur les emails de la boucle
	dep_noms_array << @dep_noms
	#un array avec pour valeur les noms de la boucle precedente
	dep_prenoms_array << @dep_prenoms
	#la meme avec les noms
	array_prenom_noms << dep_noms_array.flatten + dep_prenoms_array
	#la combinaison des deux

	end

puts Hash[array_prenom_noms.zip(@emails)]
#on combine le tout dans un hash
end

recup_omc
#on lance la methode