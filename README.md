Projet : Le scrappeur fou
  
1. Introduction
Aujourd'hui, tu vas automatiser la récupération massive de données issus de sites internet (= tu vas scraper). Tes compétences en Ruby et en HTML vont te permettre de récupérer ces informations en moins d'une journée. Tu t'amuseras avec le cours des cryptomonnaies, tu iras récupérer les e-mails des mairies de notre beau pays, puis tu chopperas la liste des e-mails des députés de France. Tu ne te penses pas capable de tout ça ? Et bien tu vas voir que si.

Les standards habituels seront attendus : un dossier bien rangé, de beaux README et Gemfile, des tests qui vérifient que tout fonctionne.

2. Le projet
2.1. Initialize
Commence par créer une structure de dossier propre avec le dossier lib, le dossier spec, etc. Créé un Gemfile, un README et fais ton $ git init. Maintenant on peut commencer à travailler 😘

2.2. Dark Trader
Lehman Brothers, impressionnés par ton algorithme d'optimisation d'achat / vente, veut encore faire appel à toi. Leur Chief Digital Officer, très hype, a entendu parler au JT de TF1 d'un "truc révolutionnaire qui s'appelle le bloque-chienne". Il veut en acheter plein. Pour le conseiller, tu vas devoir récupérer le cours de toutes les cryptomonnaies du marché.

En prenant pour source le site CoinMarketCap, fait un programme qui récupère le cours de toutes les cryptomonnaies et les enregistre bien proprement dans un array de hashs.
Ton array devra avoir le format suivant :

a = [
  { "BTC" => 5245.12 },
  { "ETH" => 217.34 }, 
  etc
]
Pour les tests, inspire-toi de la ressource plus haut. Il n'y a pas besoin de faire 36 000 tests, il faut juste arriver à tester 1) le fonctionnement de base de ton programme (pas d'erreur ni de retour vide) et 2) que ton programme sort bien un array cohérent (vérifier la présence de 2-3 cryptomonnaies, vérifier que l’array est de taille cohérente, etc.).

Quelques petites aides pour ce premier exercice :

Il est possible de faire le programme en n'allant que sur une seule URL. C'est un bon moyen pour faire un programme rapide car ne chargeant pas 2000 pages HTML.
Tout se jouera sur la rédaction d'un XPath pertinent et précis qui extrait juste ce qu'il faut d'éléments HTML. Puis un bon traitement de ces éléments pour en extraire les 2 infos dont tu as besoin : le nom des crypto et leur cours.
Un programme qui scrappe sans rien te dire, c'est non seulement nul mais en plus, tu ne sais pas s'il marche, s'il tourne en boucle ou s’il attend que ton wifi fonctionne. Mets des puts dans ton code pour que ton terminal affiche quelque chose à chaque fois qu'il a pu récupérer une donnée. Comme ça tu vois ton scrappeur qui fonctionne et avec des mots qui apparaissent tout seul sur ton terminal, tu vas donner l'impression que t'es un hacker. Stylaï.
Pense à bien nommer tes variables pour ne pas te perdre ! Par exemple, quand tu as un array, nomme-le crypto_name_array ou à minima mets son nom au pluriel crypto_nameS. Sinon tu vas oublier que c'est un array et tu vas tenter des .text dessus alors qu'il faut bosser avec un .each.
Rappel: un hash s’initialise avec result = Hash.new et on y stocke des infos avec result['ta_key'] = 'ta_value'
N'hésite pas à découper ton programme en plusieurs étapes simples et dont le fonctionnement est facile à vérifier. Par exemple : 1) Isoler les éléments HTML qui vont bien, 2) En extraire le texte et mettre ça dans un hash, 3) Réorganiser ce hash dans un array de plusieurs mini-hash comme demandé.
Même si ça n'est pas le chemin le plus court, l'essentiel est que chaque petite étape te fasse avancer et qu'à chaque fois tu te dises "ok, étape 1), ça fonctionne nickel - pas de bug. Passons à la suite".
2.3. Mairie christmas
Le CEO de Get-email Corp a besoin de tes services. Il voudrait toutes les adresses e-mail des mairies du Val d'Oise. Aucun souci pour toi. Va sur cet annuaire des mairies et récupère les adresses e-mails des mairies du Val d'Oise. Comme pour l'exercice précédent, tu devras enregistrer les données dans un array de hash suivant ce format :

a = [
  { "ville_1" => "email_1" },
  { "ville_2" => "email_2" }, 
  etc
]
Décomposons le programme en 2 sous-problème simples:

Tu dois être capable d'obtenir un e-mail de mairie à partir de la page de cette dernière (pas en partant du listing complet des mairies). Fais d'abord une méthode get_townhall_email(townhall_url) qui récupère l’e-mail d'une mairie à partir de l'URL de mairies, par exemple celle de Avernes.
Une fois que tu sais le faire pour une mairie, tu vas vouloir industrialiser et répéter ça sur tout l'annuaire du Val d'Oise. La prochaine étape est de coder une méthode get_townhall_urls qui récupère les URLs de chaque ville du Val d'Oise.
Quand tu es assez sûr que chaque méthode marche séparément, tu as juste à imbriquer les deux et à toi la gloire.

Pour les tests, ce sera la même chose que pour l'exercice précédent mais appliqué aux deux méthodes : des tests de fonctionnement de base et des tests de cohérence du résultat.

2.4. Cher député
Maintenant, fini de se faire mâcher le travail par tes gentils formateurs de THP. Tu dois récupérer la liste complète des députés de France ainsi que leurs adresses e-mail. Cherche par toi-même le site le plus aisé à scrapper et stocke les informations extraites dans une array de hashs selon ce format (un peu différent des exercices précédents) :

a = [
  { 
    "first_name" => "Jean",
    "last_name" => "Durant",
    "email" => "jean.durant@assemblée.fr"
  },
  { 
    "first_name" => "Martin",
    "last_name" => "Dupont",
    "email" => "martin.dupont@assemblée.fr"
  },
  etc
]
Pour les tests, nous t'invitons à te poser et t'inspirer des tests précédents. Deux tests suffiront.