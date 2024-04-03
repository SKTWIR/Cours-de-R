#Exercice 1
getwd() #indique le dossier par défaut ou R prend les données

#méthode 1 pour changer le dossier par défaut
#on utilise ctrl + shift + h pour redéfinir le dossier par défauts
getwd()
#ou
#Méthode 2
setwd("C://Users//irahm//OneDrive//Bureau//R//CSV")
getwd() #indique le dossier par défaut ici le doss CSV issue du setwd

bodies_kart = read.csv("bodies_karts.csv", header = TRUE, sep = ";", dec = ",")
drivers = read.csv("drivers.csv", header = TRUE, sep = ";", dec = ",")
gliders = read.csv("gliders.csv", header = TRUE, sep = "|", dec = ".")
tires = read.csv("tires.csv", header = TRUE, sep = "", dec = ",")
#fonction : read.csv 4 arguments, fichier + header (si présente true)
# + separateur colonne + separateur décimal

View(bodies_kart)
View(drivers)
View(gliders)#ouvre une fenetre pour visualiser le data frame
View(tires)

dim(bodies_kart) #affiche les dimensiosn d'un data frame
dim(drivers)
dim(gliders)
dim(tires)


#EXERCICE 2
summary(bodies_kart)
summary(drivers)
summary(gliders)
summary(tires) #résumé d'un dataset

plot(drivers$Weight, drivers$Acceleration, #variable sur le graph
     xlab = "Weight", #axe X
     ylab = "acceleration", #Axe Y
     main = "lien entre acceleration et poids") #titre graph

correlation = cor(drivers$Weight, drivers$Acceleration) #


covXY = cov(x = drivers$Weight,
            y = drivers$Acceleration)
sX = sd(drivers$Weight)
sY = sd(drivers$Acceleration)
print(covXY / (sX*sY))

# Calculer le coefficient de détermination de cette même relation.
coefCorr = cor(x = drivers$Weight,
               y = drivers$Acceleration)
coefDeter = coefCorr^2
print(coefDeter)

matriceCor = cor(drivers[ , - 1])
matriceCor = round(matriceCor , 2)
View(matriceCor)
#Toutes les variables semblent fortement corrélées entre elles.

install.packages("corrplot")
library(corrplot)

library(corrplot) #je charge mon package pour pouvoir utiliser ses fonctionalités
corrplot(matriceCor, method="circle")

#Pour tires dataset :
matriceCor = round(cor(tires[ , - 1]),1)
corrplot(matriceCor, method="color",  
         type="upper", order="hclust", 
         addCoef.col = "black", # Ajout du coefficient de corrélation
         tl.col="black", tl.srt=45, #Rotation des étiquettes de textes
         # Cacher les coefficients de corrélation sur la diagonale
         diag=FALSE 
)


#Pour bodies_karts dataset :
matriceCor = round(cor(bodies_karts[ , - 1]),1)
corrplot(matriceCor, method="color",  
         type="upper", order="hclust", 
         addCoef.col = "black", # Ajout du coefficient de corrélation
         tl.col="black", tl.srt=45, #Rotation des étiquettes de textes
         # Cacher les coefficients de corrélation sur la diagonale
         diag=FALSE 
)

#Pour gliders dataset :
matriceCor = round(cor(gliders[ , - 1]),1)
corrplot(matriceCor, method="color",  
         type="upper", order="hclust", 
         addCoef.col = "black", # Ajout du coefficient de corrélation
         tl.col="black", tl.srt=45, #Rotation des étiquettes de textes
         # Cacher les coefficients de corrélation sur la diagonale
         diag=FALSE 
)



#EXERCICE 3
resultat = drivers[,c("Driver","Weight")]
View(resultat)

resultat = drivers[1:10,c("Driver","Acceleration")]
View(resultat)

resultat = drivers[,-c(5,7,9)]
View(resultat)

resultat = drivers[ ,-c(2,3)]
View(resultat)

resultat = drivers[ , c("Driver","Acceleration","Weight")]
View(resultat)


resultat = drivers[ c(3,12,32),]
View(resultat)

resultat = drivers[ c(32,3,12),]
View(resultat)


resultat = drivers[order(drivers$Weight, decreasing =  FALSE) , c("Driver", "Weight")]
View(resultat)


resultat = drivers[order(drivers$Acceleration, decreasing =  TRUE) , c("Driver", "Acceleration")]
View(resultat)

rang = order(drivers$Acceleration, drivers$Weight, decreasing = TRUE)
resultat = drivers[ rang , c("Driver","Weight","Acceleration")]
View(resultat)


#EXERCICE 4
help(subset) #permet d'avoir de laide
topDriver = subset(drivers, 
                   Acceleration == max(Acceleration),
                   c("Driver","Acceleration"))

topGlider = subset(gliders, 
                   Acceleration == max(Acceleration),
                   c("Glider","Acceleration"))
topTires = subset(tires, 
                  Acceleration == max(Acceleration),
                  c("Tire","Acceleration"))

topBody = subset(bodies_kart, 
                 Acceleration == max(Acceleration),
                 c("Body","Acceleration"))
View(topBody)
View(topDriver)
View(topGlider)
View(topTires)