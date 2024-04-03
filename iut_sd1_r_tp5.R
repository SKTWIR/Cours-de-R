#Exercice 1 - Importer les données

#CTRL + SHIFT + H pour affilier un nouveau dossier par défaut

getwd()

fichiers <- list.files(pattern = ".csv$", full.names = TRUE)
print(fichiers)
#argument path en premier en indiquant le dossier

nom_fichier = basename(fichiers[1])#renvoie le premier fichier de la variable fichiers

library(tools)
nom_fichier_sans_extension = file_path_sans_ext(x = nom_fichier) #extrait le nom d'un fichier sans extension
print(nom_fichier_sans_extension)

assign(x = fichiers[1],
       value = read.csv(nom_fichier,
                        sep = ",",
                        dec = "."))
View(common_player_info.csv)



# Boucle pour lire chaque fichier CSV
for (fichier in fichiers) {
  # Extraire le nom du fichier sans extension
  nom_objet <- file_path_sans_ext(basename(fichier))
  
  # Lire le fichier CSV et l'affecter à une variable avec le nom du fichier
  start_time <- Sys.time()
  assign(nom_objet, read.csv(fichier, 
                             sep = ",",
                             dec = "."))
  end_time <- Sys.time()
  # Calcul du temps écoulé
  execution_time <- end_time - start_time
  cat("Importation : ",nom_objet, "=" , execution_time , "\n")
}





#Exercice 2 : Les jointures


#combien de match à LA
df_x = subset(team, city == "Los Angeles", select = c("id", "city"))
#subset avec les équipes de LA

df_y = subset(game, select = c("game_id", "team_id_home"))
#Subset avec les parties qui se sont jouer a LA

dfJoin = merge(x = df_x, y = df_y, #on donne x et y les df a fusionner
               by.x = "id", #les noms des colonnes dans x et y à utiliser comme clés de fusion
               by.y = "team_id_home", 
               all.x = TRUE) #on inclus toute les obervation de x ici la ville
nrow(dfJoin)
View(dfJoin)




#affluence moyenne d'un match à LA
df_x = dfJoin


df_y = subset(game_info, select = c("game_id", "attendance"))

dfJoin = merge(x = df_x, y = df_y,
               by = "game_id",
               all.x = TRUE)
mean(dfJoin$attendance, na.rm = TRUE)
View(dfJoin)

#Combien d'arbitres différents ont officié durant la saison 2020.

df_x = subset(game_summary, season == 2020,
              select = c("game_id", "season"))

dfJoin = merge(x = df_x, y = officials,
               by = "game_id",
               all.x = TRUE)
length(unique(dfJoin$official_id))
View(dfJoin)

#Combien de matchs à officié Dick Bavetta par saison ?

df_x = subset(game_summary,
              select = c("game_id", "season"))
df_y = subset(officials, first_name == "Dick" & last_name == "Bavetta")
dfJoin = merge(x = df_x, y = df_y, 
               by = "game_id",
               all.y = TRUE)
View(dfJoin)
table(dfJoin$season)


#Exercice 3 - GOAT : Connexion à une database SQLite
































