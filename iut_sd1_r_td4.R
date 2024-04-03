#EXO 1
df = read.csv("velov.csv", header = TRUE, sep = ";", dec = ",")
View(df)
summary(df) #resumé

df$status = as.factor(df$status) #changment de type de la variable
df$CodePostal = as.factor(df$CodePostal)
summary(df)


df$bornes = ifelse(df$capacity != (df$bikes + df$stands), "KO","OK")
df$bornes = as.factor(df$bornes)
table(df$bornes)#ne marche pas ???
summary(df$bornes) #69 station KO

#EXERCICE 2.
hist(df$capacity, main = "Capacité", #titre
     xlab = "capapcity", #nom de l'abcisse
     col = "grey",#couleur
     breaks = 6,#les classes
     probability = FALSE,
     ylim = c(0,300),
     xlim = c(0,120))
abline(h=100, col = "red", lty = 2)



hist(x = df$capacity, 
     main = "Distribution de \n la capacité des stations",
     col = "grey",
     probability = TRUE,
     xlab = "Capacity",
     ylim = c(0,0.08))
lines(density(df$capacity),
      lty = 2,
      col = "blue",
      lwd = 4)

#EXERCICE 3
boxplot(df$capacity,
        main = "flemme")

boxplot(df$capacity,
        main = "flemme",
        horizontal = TRUE) #a l'horizontal

boxplot(df$capacity,
        main = "flemme",
        outline = FALSE)#sans valeur atypqiue
points(mean(df$capacity), #rajouté un point
       col = "red",
       pch = 15)#faire un carré

#fonctions par
par(mfrow=c(1,2)) #fenêtre sur 1 ligne et 2 colonnes
#7ème
df7 = subset(df, CodePostal == "69007") #data frame crée pour lyon 7
boxplot(x = df7$bikes, 
        main = "Boxplot nb vélos \n 69007",
        ylim = c(0,40))
#8ème
df8 = subset(df, CodePostal == "69008") #data frame crée pour lyon 8
boxplot(x = df8$bikes, 
        main = "Boxplot nb vélos \n 69008",
        ylim = c(0,40))


par(mfrow=c(1,1))
boxplot(formula = df$bikes ~ df$bonus,
        data = df,
        main = "Dispo vélos vs Stations Bonus")

# Calculer les moyennes de chaque groupe
means <- tapply(X = df$bikes, 
                INDEX = df$bonus, 
                FUN = function(X) mean(X))
print(means)
# Ajouter les moyennes de chaque groupe au graphique
points(means, col = "red", pch = 19)


#exo 4 le diagramme
effectif = table(df$bonus)#création de 
barplot(height = effectif,
        main = "Répartition du nombre \n de station bonus")

freQQ = prop.table(effectif)#création de 
barplot(height = effectif,
        main = "Répartition du nombre \n de station bonus",
        horiz = TRUE)

