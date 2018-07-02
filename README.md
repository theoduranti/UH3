
### lien de prod : https://salty-brook-35546.herokuapp.com</br></br>


En dev marche pas, mais marche en prod (PGsql comprend qu'une colonne peut être array, en dev non)</br></br>

``` 
Prob : dans index de event, form, comment appeler la fonction self.search2 contenu dans events.rb </br>
la diff c'est d'utiliser .select dans le form alors que on n'a pas de s. ...) </br>
Solution de secours, créer un controller et model search, où l'on met toute les fonctions.</br>
Mais du coup ça créé une nouvelle vue show search: on mettra un lien d'accès à cette recherche avancée sur la page root)
```

