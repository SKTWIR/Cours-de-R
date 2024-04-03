#Exercice 1 - Les objets et les vecteurs


#Créer un objet a avec la valeur 10 et un objet b avec la valeur 5.
a = 10 # rédaction possible : a <- 5
b = 5 # rédaction possible : b <- 10

# multiplication de deux élément a et b
resultat = a*b
print(resultat) #afficher le résultats

#création de float
A = 7.2
B = 10.1

rm(a,A,b,B,resultat) #supression des variables

#exercice 2

vecteur = c(1,2,3,4,5) #création d'un vecteur
print(class(vecteur)) #afficher la classe du vecteur
print(vecteur[3]) #Afficher le troisième élément du vecteur

v1 = 1:5 #création d'un vecteur ici la classe est int

v2 = v1+3 #créer v2 en ajoutant 3 à chaque élément de v1

v3 = seq(1,6,1) #class : num
#OU
v3 = 1:6 #class : int

v4 = v3**2 #ou v4 = v3^2

v5 = v4/2

semaine = c("lundi", "mardi", "mercredi", "jeudi", "vendredi", "samedi", "dimanche")
class(semaine) # chaine de caractere
print(semaine[c(2,7)]) #pr afficher deux element différent on doit les concaténé

#Créer un vecteur avec des valeurs booléennes et afficher sa classe.

booléen = c(TRUE,FALSE,TRUE,FALSE)
class(booléen) #il est considéré comme logical


v7 = c(1.25,5.55,6.33,9.88)
class(v7) #numéric
print(v7[-3]) #n'affiche pas la valeur présente dans l'intervalle

mois = c("janvier", "février", "mars", "avril", "mai", "juin", "juillet", "aout", "septembre", "octobre", "novembre", "decembre")
class(mois)
print(mois[c(1:3)])

v8 = c(-1,-3,-9,-8)
class(v8)
print(v8[c(1,4)])#affiche les valeur présente dans l'intervalle

fuirts = c("caca","kaki", "collé","au","cucul")

VM = c(1,2,NA,5,6)
class(VM)

v9 = seq(1,10,1)
length(v9)

v10 = seq(2,20,2)
length(v10)

v11 = seq(-5,0)
length(v11)

v12 = seq(5,50,5)
length(v12)

v13 = seq(10,1)
length(v13)


v14 = seq(0,1,0.1)
length(v14)

v15 = seq(5,-5,-1)
length(v15)

v16 = seq(1,10,2)
length(v16)

#Les fonctions c(), rep()

v17 = rep(3,5)

v18 = rep(c("A","B","C"),3)

v19 = rep(c(1,2,3),3)#numeric
v19 = rep(1:3,3)#integer

v20 = rep(c(TRUE,FALSE),4)

rm(list = ls()) #TOUT SUPPRIMER

#exercice 3

vecteur = runif(5,0,1) #générer un vecteur de 5 nb alea entre 0 et 1

vecteur = runif(10,-5,5)
mean(vecteur)
median(vecteur)
min(vecteur)
max(vecteur)

vecteur = runif(100,10,20)
mean(vecteur)
median(vecteur)
min(vecteur)
max(vecteur)



vecteur = runif(15,50,100) #runif pr la distrib uniforme
mean(vecteur)
median(vecteur)
min(vecteur)
max(vecteur)


vecteur = rnorm(20,-2,3) #rnorm loi normale
mean(vecteur)
sd(vecteur)



vecteur = rnorm(2000,-2,3) #rnorm loi normale
mean(vecteur)
sd(vecteur)

vecteur = rnorm(2000,0,1) #rnorm loi normale
mean(vecteur)
sd(vecteur)


quantile(vecteur,c(0.25,0.5,0.75)) #2 truc le vecteur et les quantile

quantile(vecteur,seq(0,1,0.1)) #seq 3 argument, intervale + pas


quantile(vecteur,seq(0,1,0.01))



#Les fonctions sum() , round()


echantillon = rnorm(3000,2400,300)
mean(echantillon)
sd(echantillon)

round(echantillon,2) #2 argument ce que l'on veut arrondir et de combien

sum(echantillon)

median(echantillon)

quantile(echantillon,0.99)


quantile(echantillon,0.2)

#Les fonctions sample(), table(), prop.table() , unique(), sort()

sample(x = c(1,2,3,4,5,6), size = 1) #simulé 1 jet de dé

simulation = sample(x = c(1,2,3,4,5,6), size = 12,TRUE)

#le fait d'avoir plusieurs tirage crée un vecteur


unique(simulation)


table(simulation)

prop.table( table(simulation) )


simulation = sample(x = c(1,2,3,4,5,6), size = 100000,TRUE)

frequence = prop.table(table(simulation))
sort(frequence, decreasing = TRUE)









