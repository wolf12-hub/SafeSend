meteo – Aide aux victimes de violence domestique, traite ou danger immédiat
meteo est une application Android conçue pour permettre aux victimes de violence domestique, de traite des êtres humains ou de toute situation de danger immédiat d’envoyer un signal de détresse sans éveiller les soupçons de l’agresseur.

L’application se fait passer pour une application ordinaire (météo). En apparence, rien ne distingue meteo d’un outil banal. Mais en réalité, elle contient un mécanisme discret de déclenchement d’alerte.

Fonctionnalités principales
Apparence inoffensive
L’application se déguise en outil classique ( météo). L’agresseur ne voit qu’une application normale.

Actions automatiques sécurisées
Une fois le signal déclenché, l’application exécute discrètement :

Envoi d’un SMS ou message chiffré à un contact d’urgence (avec position GPS )


Enregistrement audio ou vidéo en arrière-plan (optionnel et conforme à la législation locale)

Effacement automatique de toute trace visible du déclenchement

Stack technique
Plateforme : Android (minimum API 24)

Langage : Dart (Flutter)

Fonctionnalités clés :

Gestion des gestes personnalisés (sensors, flutter_phone_state)

Accès à la localisation (geolocator)

Envoi de messages (sms, http pour API sécurisée)

Stockage local chiffré (flutter_secure_storage)

Sécurité et discrétion
Aucune icône suspecte : l’application porte le nom et l’icône d’une app de meteo.

Pas de notification visible lors du déclenchement.

Installation et configuration initiale
Premier lancement : l’utilisateur entre 3 numeros d'urgence

Mode normal : l’application se comporte comme une app de météo de ordinaire.

Contribution
Ce projet est open source, Les contributions sont les bienvenues, notamment pour :

Ajouter de nouveaux leurres d’interface

Améliorer la robustesse du déclenchement discret

Tester la résistance à l’inspection par un agresseur

Avertissement légal et éthique
Cette application doit être utilisée uniquement dans un cadre légitime d’autodéfense et d’aide aux victimes. L’utilisateur est responsable de vérifier que les actions automatiques (enregistrement, géolocalisation, SMS) sont autorisées par la législation locale.

Problèmes résolus par l'application
1. La surveillance constante de l'agresseur
Problème : L'agresseur peut contrôler le téléphone de la victime (consultation des appels, messages, historique, applications installées). Appeler la police ou envoyer un SMS d'alerte expose la victime à des représailles immédiates.

Solution : L'application ressemble à une calculatrice ou une météo. Rien ne trahit sa vraie fonction. L'alerte se déclenche sans changer l'écran.

2. L'impossibilité d'appeler à l'aide sans éveiller les soupçons
Problème : Composer le 17, 114 ou un numéro d'aide, c'est :

faire du bruit (sonnerie, voix)

laisser une trace visible (appel récent, SMS envoyé)

changer de comportement (quitter l'application brutalement)

Solution : Le geste secret (secousse, code sur la calculatrice) déclenche l'alerte en silence. L'écran continue d'afficher "2+3=5". L'agresseur ne voit rien d'anormal.

3. La difficulté à donner sa position discrètement
Problème : Une victime qui réussit à envoyer un message ne peut pas toujours décrire où elle se trouve (stress, peur, impossibilité de parler).

Solution : L'application envoie automatiquement la localisation GPS précise avec l'alerte, sans que la victime ait à taper un mot.

4. L'absence de preuve en cas de violence
Problème : Beaucoup de victimes n'ont aucun enregistrement des menaces ou des coups. Sans preuve, la plainte est plus difficile.

Solution : L'application peut déclencher un enregistrement audio/vidéo en arrière-plan, sans que l'agresseur le sache. Cela constitue une preuve utilisable plus tard.

5. L'auto-censure par peur des représailles
Problème : Même quand elles sont seules, les victimes hésitent à configurer une aide explicite (peur que l'agresseur découvre l'application "Alerte danger" sur le téléphone).

Solution : Dès l'installation, l'application est déjà déguisée. La configuration est cachée (exemple : taper 5 fois sur le résultat de la calculatrice). Rien n'est visible.

6. La difficulté pour les associations/policiers de guider la victime à distance
Problème : Une victime ne peut pas toujours dire "je vais déclencher l'alerte maintenant" sans éveiller les soupçons.

Solution : L'application permet une aide totalement silencieuse et autonome. La victime agit seule, sans avoir à communiquer son intention.
