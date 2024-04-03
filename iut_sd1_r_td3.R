#install.packages("readxl")
library(readxl)

setwd("C:/Users/irahm/OneDrive/Bureau/R/TD3")

pokemon = read_excel(path = "pokemon.xlsx",
                  sheet = "pokemon")

dim(pokemon) #dimension entiere
nrow(pokemon) #nb ligne
ncol(pokemon) #nb colonnes

summary(pokemon) #résumé


pokemon$is_legendary = as.factor(pokemon$is_legendary)
pokemon$type  = as.factor(pokemon$type )
pokemon$generation = as.factor(pokemon$generation)
summary(pokemon)


med = median(pokemon$attack)
pokemon$attack_group = ifelse(pokemon$attack > med, "attack +","attack -")
pokemon$attack_group = as.factor(pokemon$attack_group)


pokemon$water_fire = ifelse(pokemon$type %in% c("water","fire"),"yes","no")
pokemon$water_fire = as.factor(pokemon$water_fire)
summary(pokemon$water_fire)





q3_attack = quantile(pokemon$attack, probs = 0.75)
q3_defense = quantile(pokemon$defense, probs = 0.75)
q3_speed = quantile(pokemon$speed, probs = 0.75)

pokemon$best = ifelse(pokemon$attack > q3_attack &
                      pokemon$defense > q3_defense &
                      pokemon$speed > q3_speed,
                      "yes","no") #il est possible de mettre plusieurs test dans un seul ave le et commercial
pokemon$best = as.factor(pokemon$best)
summary(pokemon$best)



requete = subset(pokemon, is.na(weight_kg)) #subset trie en fonction d'un data frame et d'une indications ici le is na
View(requete)

requete = subset(pokemon, !is.na(weight_kg)) #subset trie en fonction d'un data frame et d'une indications ici le is na
View(requete)


weight_kgNa = median(pokemon$weight_kg, na.rm = TRUE)
pokemon$weight_kg = ifelse(is.na(pokemon$weight_kg),
                           weight_kgNa,pokemon$weight_kg)


height_mNA = median(pokemon$height_m, na.rm = TRUE)
pokemon$height_m = ifelse(is.na(pokemon$height_m),
                           height_mNA,pokemon$height_m)
pokemon$weight_group = cut(x = pokemon$weight_kg, 
                   breaks = 3, 
                   labels = c("léger", "Moyen", "Lourd"))

pokemon$height_m_group = cut(pokemon$height_m,
                             breaks = c(0,1,2,3,
                             max(pokemon$height_m,
                             na.rm = TRUE)))

pokemon$defense_group = cut(pokemon$defense,
                            breaks = quantile(pokemon$defense,
                                              na.rm =  TRUE), 
                            include.lowest = TRUE) #ici vu qu'on demande les cartiles on utilise les cartiles dans breaks qui sert a couper en plusieur partis

#foncitons agregats EXERCICE 3

aggregate(attack ~ type, pokemon, function(x) mean(x)) #TOUJOURS mettre le function(x)



aggregate(attack ~ generation + type, pokemon, function(x) median(x)) #TOUJOURS mettre le function(x)

# "~" sert à l'aggregation
#si on doit faire en fonction de 2 ou + type d'aggregation, 
#juste mettre un +


aggregate(pokedex_number ~ type, pokemon, function(x) length(x) )


aggregate(speed ~ generation + type, 
          pokemon, 
          function(x) c(moy = mean(x),
                        med = median(x),
                        eff = length(x)))
# ici : plusieurs colonnes était demandé du coup on utilise c()
# pour concatener les informations demandé








