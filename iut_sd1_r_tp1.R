#exercice 1
iris #dataframe inclus dans R de façon par défaut
class(iris) #indique sa class
View(iris) #ouvre une nouvelle fenetre pour voir la variable

nrow(iris)
ncol(iris)
colnames(iris)
summary(iris)

iris[ , c("Sepal.Length","Species")] #a droite pour les colonnes
iris[ c(100,103,105), ] #à gauche pour les lignes
iris[ 50:100, ]

mean(iris$Sepal.Length)
median(iris$Sepal.Width)
sd(iris$Petal.Length)
quantile(iris$Petal.Width, seq(0.1,0.9,0.1))

#Exercice 2

dfmanga = read.csv("C:/Users/irahm/OneDrive/Bureau/R/CSV/manga.csv", header = TRUE, dec = ".", sep = ",")
dfanime = read.csv("C:/Users/irahm/OneDrive/Bureau/R/CSV/anime.csv", header = TRUE, dec = ".", sep = ",")
#toujours ouvrir le CSV pour connaitre separateur et decimal

class(dfmanga)
class(dfanime)
View(dfmanga)
View(dfanime)
dim(dfmanga)
dim(dfanime)

mean(dfanime$Score)
mean(dfmanga$Score)


sum(dfanime$Vote)
sum(dfmanga$Vote)

sd(dfanime$Score)
sd(dfmanga$Score)

quantile(dfanime$Score, seq(0.1,1,0.1))
quantile(dfmanga$Score, seq(0.1,1,0.1))


extraction1 = subset(dfmanga, Score >= 9) #créer un sous ensemble, doncn ici un data frame
nrow(extraction1) #pour voir le nombre de manga qui remplit les conditions

extraction2 = subset(dfmanga,Vote >= 200000 )
nrow(extraction2) #pour voir le nombre de manga qui remplit les conditions

extraction3 = subset(dfmanga,Vote >= 200000 & Score >= 8)
nrow(extraction3) #pour voir le nombre de manga qui remplit les conditions

extraction4 = subset(dfmanga, Score <= 8 & Score >= 7)
nrow(extraction4)


effectifRating = table(dfanime$Rating)
print(effectifRating)
length(effectifRating)
prop.table(effectifRating) #sert a calculer la proportion dans un tableau

extraction2 = subset(dfanime, Rating == "R - 17+ (violence & profanity)")
nrow(extraction2)

extraction3 = subset(dfanime, Rating == "R - 17+ (violence & profanity" & Score >= 8)
nrow(extraction3)


extraction4 = subset(dfanime, Rating != "R - 17+ (violence & profanity")
nrow(extraction4)

extraction5 = subset(dfanime, Rating == "PG - Children et G - All Ages")
nrow(extraction5)

extraction5 = subset(dfanime, Rating != "PG - Children et G - All Ages")
nrow(extraction5)


extraction6 = subset(dfanime, Score >= 9 & Vote >= 400000 ) #on peut utiliser & ou | pour l'argument
nrow(extraction6)

dfanime <- dfanime[ , c("Title","Score","Vote","Ranked")]
dfmanga <- dfmanga[ , c("Title","Score","Vote","Ranked")]

dfanime$Type = "Anime" #ajoute la valeur après le = dans la nouvelle colonne
dfmanga$Type = "Manga" #ajoute la valeur après le = dans la nouvelle colonne
View(dfanime)


dfConcat = rbind(dfanime, dfmanga) #concatene DEUX ou + dataframe

View(dfConcat)

write.table(dfConcat, file = "C://Users//irahm//OneDrive//Bureau//R//CSV//ExportTp1.csv", sep = ",", row.names = FALSE)