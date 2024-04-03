#Exercice 1 - Comprendre la loi normale


# Créer une toile de fond vide pour le graphique
par(mfrow = c(1,1))
plot(NA, xlim=c(-5, 5), #abscisse
     ylim=c(0, 1),#ordonnées
     xlab="X", 
     ylab="Densité de probabilité", 
     main="Densités de probabilité \n de lois normales")

# Tracer la densité de probabilité pour chaque simulation
moyennes = c(0, 0, 0, -2)
sigmas = c(0.45, 1, 2.25, 0.7)
colors = c("red", "blue", "green", "orange")
legend_labels <- c()
for (i in 1:length(moyennes)) #ici la variable moyenne de 4 éléments
  {
  serie = rnorm(n = 1e5, #nombre points
                mean = moyennes[i], #comme sur python on récupère la valuer à la i-ème position
                sd = sigmas[i])
  lines(density(serie), col = colors[i])
  legend_labels <- c(legend_labels, paste("m =", moyennes[i], ",", "s =", sigmas[i]))
}

# Ajouter une légende
legend("topright", legend=legend_labels, col=colors, lwd=2, cex=0.8)

#Simuler une loi normale N(μ=0, σ=1) de taille 10 000.
serie = rnorm(n = 1e4, mean = 0, sd = 1)

#Contruire l'histograme de la distribution de la série avec sa courbe densité

hist(x = serie, #déclaration de l'histogramme
     main = "loi normal centrée-réduite", #titre
     probability = TRUE) #les hauteurs des barres représentent des densités de probabilité plutôt que des effectifs 
lines(density(serie))#rajoute la courbe de densité de la variable série

#calculer la mediane de la serie
median(serie)

#Calculer les quartiles de la série.
quantile(serie) #pas besoin de rajouter c(...) puisque la fonction calcule déjà les quartiles

quantile(serie,seq(0.1,0.9,0.1))

quantile(serie, probs = 0.95)#valeur de la série correspondant au centile 0.95

#Calculer la valeur théorique à l'aide de la fonction qnorm()
qnorm(0.95, mean = 0, sd = 1)
#Vérifier cette valeur avec la fonction réciproque pnorm()
pnorm(1.644854, mean = 0, sd = 1)

#Quelle est la valeur théorique pour P(X < x) = 0.975.
qnorm(0.975, mean = 0, sd = 1)

#Quelle est la probabilité théorique pour P(X >= 1.96) = p.
pnorm(1.96, mean = 0, sd = 1)


#Exercice 2 - Construire la table de loi normale

indices_lignes = seq(from = 0, to = 3.9, by = 0.1)

#on crée un vecteur vide pour ajouter les probas au fur et à mesure
all_probas = c()
#On parcourt les indices lignes
for (i in indices_lignes){
  proba = pnorm(q = i, mean = 0, sd = 1)
  #on ajoute la nouvelle proba au vecteur existant
  all_probas = c(all_probas,proba)
  all_probas = round(all_probas,digits = 4)
}

#Modifier ce code pour construire la table de loi normale.
indices_colones = seq(from = 0.00, to = 0.09, by = 0.01)
indices_lignes = seq(from = 0, to = 3.9, by = 0.1)

#On crée un objet résultat vide.
resultat = NULL
#On parcourt les indices colonnes
for (j in indices_colones) {
  #on crée un vecteur vide pour ajouter les probas au fur et à mesure
  all_probas = c()
  #On parcourt les indices lignes
  for (i in indices_lignes){
    quantile = i + j
    proba = pnorm(q = quantile, mean = 0, sd = 1)
    #on ajoute la nouvelle proba au vecteur existant
    all_probas = c(all_probas,proba)
    all_probas = round(all_probas,digits = 4)
  }
  #On ajoute une colonne au resultat
  resultat = cbind(resultat,all_probas)
}

#Modifier le nom des lignes et colonnes.
class(resultat)
table = data.frame(resultat) #transofrmation de resultat en dataframe
colnames(table) = indices_colones 
rownames(table) = indices_lignes
View(table)


#Exercice 3 - Simulation d'une population

moyenne_pop<-171
sd_pop<-9
population<-rnorm(n = 1e7, 
                  mean=moyenne_pop, 
                  sd=sd_pop)
#Calculer la moyenne et l'écart-type de la population
mean(population)
sd(population)

hist(population)

#observé
pop190 = population[population < 190]
length(pop190)
length(pop190) / length(population)

#en théorie
pnorm(q = 190, mean=moyenne_pop, sd=sd_pop)*1e7


#Combien de personnes ont une taille supérieur à 200 cm
#observé
pop200 = population[population >= 200]
length(pop200)
length(pop200) / length(population)

#en théorie
#proba de P( X < 200cm)
proba_inf_200 = pnorm(q = 200, mean=moyenne_pop, sd=sd_pop)
#proba de P( X >= 200cm)
1 - proba_inf_200


#Exercice 4 - Simulation d'échantillon

echantillon_aleatoire = sample(population,
                               size = 1000,
                               replace = TRUE)
mean(echantillon_aleatoire)
sd(echantillon_aleatoire)








