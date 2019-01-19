# THP 10ème jour - Default folder

Automatisation des tâches avec la création d'un petit programme pour créer automatiquement un environnement de travail pour un projet en Ruby 💎

## mkdiruby.rb
Le programme va créer :
* un dossier avec un nom au choix de l'utilisateur
* un fichier Gemfile avec les gems les plus fréquemment utilisées
* une commande `$ git init`
* une commande `$ rspec --init`
* un fichier .env
* un fichier .gitignore rempli avec `.env`
* un dossier `lib`
* un fichier `README.md`
* une commande `$ bundle install`
* des commandes pour créer un repository Github (pour cela il faudra installer hub – https://hub.github.com/), un premier `commit` et un premier `push origin master`

Il faudra créer un alias pour que la commande soit reconnue dans le terminal :
`alias mkdiruby="ruby /home/ton/chemin/vers/mkdiruby.rb"`

Programme Ruby réalisé dans le cadre de la formation THP, *The Hacking Project*.
