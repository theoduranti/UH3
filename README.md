
### lien de prod : https://salty-brook-35546.herokuapp.com</br></br>


En dev marche pas, mais marche en prod (gmsql comprend qu'une colonne peut être array, en dev non)</br></br>

Pour que la prod fonctionne correctement, il ne reste plus qu'à modifier toutes les vues :</br>
Remplacer tout ce qui est boucle avec asubscribeX et apayerX en
</br>
``` 
@event.asubscribe.each do |iddd|
  if current_ele.id == iddd
    ...
  end
end
```

