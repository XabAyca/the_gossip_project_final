# The Gossip Project BDD
Allez, on va poser les bases de notre fameux Gossip Project pour le transcrire en Rails. Et comme je te l'ai   expliqué, la première étape est la modélisation de sa BDD !  
Le parcours utilisateur est le suivant : sur ce super réseau social, un utilisateur va s'inscrire, renseigner   son prénom et nom, son mail et son age, puis il précisera sa ville avec une recherche par code postal.  
Il aura ensuite toutes les fonctionnalités qui feront de cette appli une future licorne de la Bitchin'Tech :  

Les utilisateurs peuvent créer des potins : "askip john est célib hihi"  
Les utilisateurs, en créant des potins, peuvent mettre un ou plusieurs tags sur les potins : #romance  
Les utilisateurs peuvent commenter des potins : "ahiii j'savé pa lol ptdr 💁‍♂️"  
Et puisque ton appli doit respecter les standards de l'industrie, on va faire en sorte qu'il soit possible aussi de commenter des commentaires.  
Les utilisateurs peuvent liker des potins.  
Les utilisateurs peuvent contacter leur commères favoris en MP pour obtenir des exclus mondiales.  
L'utilisateur pourra donc rechercher les potins par ville, par utilisateurs, par date (plus récent ou plus   ancien), par nombre de likes, par tags, pour trouver les potins les plus croustillants. 

### Tables

City    
Comment    
User  
Gossip    
Join table: tag<=>gossip  
Like  
Private message  
Tag   

### Views  

Home  
Contact  
Show(gossip)  
Team  
User_show  
Welcome  

### Pour test
Lancer   
```rails server``  
Puis aller sur  
```http://localhost:3000/``  
Sur votre navigateur favori...  
Enjoy...