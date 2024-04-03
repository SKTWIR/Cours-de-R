#EXERCICE 1
getwd()
setwd("C://Users//irahm//OneDrive//Bureau//R//CSV")

df= read.csv("fao.csv", #nom du fichier
         header = TRUE, #en tete
         sep = ";", #separateur colonne
         dec = ",") #separateur decimal
View(df) #ouvre une fenetre

nrow(df)#nombre ligne
#186 pays présent

summary(df) #résumé de la variable, ici df

#EXERCICE 2

mean(df$Dispo_alim, na.rm = TRUE) # na.rm signifie enlever les valeurs manquantes

sum(df$Population, na.rm = TRUE)

sd(df$Export_viande) #ecart type
sd(df$Import_viande)
median(df$Prod_viande, na.rm = TRUE)

quantile(df$Dispo_alim) #pour les quartiles, pas besoin de seq

quantile(df$Import_viande, seq(0.1,1,0.1))

#EXERCICE 3

rang = order(df$Population)

flop5 = head(df[rang,], n=5)
View(flop5)

rang = order(df$Population, decreasing = TRUE)
top5 = head(df[rang,], n=5)
View(top5)

rang = order(df$Prod_viande, decreasing = TRUE)
top5V = head(df[rang,], n=5)
View(top5V)


rang = order(df$Import_viande, decreasing = TRUE)
top5I = head(df[rang,], n=5)
View(top5I)

DispoAlim = subset(df, df$Dispo_alim >3500 & df$Import_viande >= 1000 )
nrow(DispoAlim)

FRABEL = subset(df, df$Nom == c("France","Belgique"))
View(FRABEL)


#EXERCICE 4

df$part_export = (df$Export_viande/df$Prod_viande)*100
View(df)


df$dispo_alim_pays = df$Dispo_alim*df$Population
View(df)

write.table(df,"exporttp2.csv") #créer un CSV a partir d'un dataframe


sum(df$dispo_alim_pays, na.rm = TRUE)

nourrir = sum(df$dispo_alim_pays, na.rm = TRUE)
print(nourrir)


nourrir/2300


#Exercice 5

plot(df$Prod_viande, df$Export_viande,
     xlab = "prod_viande", 
     ylab = "Export viande", 
     main = "Nuage de points")

cor(x = df$Prod_viande,
    y = df$Export_viande)

matriceCor = cor(df[ , - 1] , use = "complete.obs")#pour la matrice de correlation
matriceCor = round(matriceCor , 2)
View(matriceCor)


install.packages("corrplot") 
library(corrplot)
help("corrplot")
corrplot(matriceCor,"circle")# permet de faire un Corrélogramme 
#2 argument, la amtrice et circle
