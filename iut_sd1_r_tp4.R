#Exercice 1 - Création de fonction
SalaireCadre = function(salaire) {
  calcul = salaire*0.75
  
return(calcul)}

SalaireCadre(salaire = 3000)

# Modifier la fonction pour que ce salaire mensuel brut avant impôt soit de 2500€ 
#si l'utilisateur ne renseigne pas ce paramètre.
SalaireCadre = function(salaire = 2500) {
  calcul = salaire*0.75
  
  return(calcul)}

SalaireCadre()


#ajoutant le paramètre temps de travail avec comme valeur par défaut 100%
SalaireNetCadre = function(salaire = 2500, TempsW = 1) 
  {
  calcul = salaire* TempsW
  
  return(calcul)}
SalaireNetCadre(2500,0.5)


#retourne une erreur si le salaire mensuel brut en entrée n'est pas une valeur numerique

SalaireNetCadre = function(salaire = 2500, TempsW = 1) 
{
  if(!is.numeric(salaire)){
    return("on ne peut pas réaliser le calcul")
    }
  
  
  calcul = salaire* TempsW
  
  return(calcul)}

SalaireNetCadre("2500", 1) #ça marche

#retourne une erreur si le temps de travail n'est pas numérique et n'est pas compris entre 0 et 1.

SalaireNetCadre = function(salaire = 2500, TempsW = 1) 
{
  if(!is.numeric(salaire)){
    return("on ne peut pas réaliser le calcul")
    }
  
  if (!is.numeric(TempsW) | (TempsW <= 0) | (TempsW > 1)) {
    return("Erreur :  le temps de travail doit être une valeur numérique entre 0 et 1")
    }
  
  calcul = salaire* TempsW
  
  return(calcul)
  }

SalaireNetCadre(2500,0.5)



#crée la fonction salaire net avec l'argument cadre ou non cadre


salaire_net = function(salaire = 2500, tempsw = 1, statut)
  {
  if(!is.numeric(salaire)){
    return("on ne peut pas réaliser le calcul")
  }
  
  if (!is.numeric(tempsw) | (tempsw <= 0) | (tempsw > 1)) {
    return("Erreur :  le temps de travail doit être une valeur numérique entre 0 et 1")
  }
  
  if (!statut %in% c("cadre","non cadre")) {
    return("Erreur :  le statut doit être cadre ou non cadre")}
  
  if (statut == "cadre") {
    calcul = salaire * tempsw * 0.75
  } else{calcul = salaire * tempsw * 0.78}
  
return(calcul)}


salaire_net(salaire = 2500, tempsw = 1, statut = "non cadre")


#calculer le salaire net mensuel après prélèvement à la source

salaire_net = function(salaire = 2500, tempsw = 1, statut)
{
  
#VERIFIVAITON DES ARGUMENT  
  if(!is.numeric(salaire)){
    return("on ne peut pas réaliser le calcul")
  }
  
  if (!is.numeric(tempsw) | (tempsw <= 0) | (tempsw > 1)) {
    return("Erreur :  le temps de travail doit être une valeur numérique entre 0 et 1")
  }
  
  if (!statut %in% c("cadre","non cadre")) {
    return("Erreur :  le statut doit être cadre ou non cadre")
    }
#VERIFIVAITON DES ARGUMENT
  
  
#cALCUL DU SALAIRE NET
  if (statut == "cadre") {
    calcul1 = salaire * tempsw * 0.75
  } else{calcul1 = salaire * tempsw * 0.78}
#cALCUL DU SALAIRE NET
  
  
#CALCUL DU SALAIRE APRES IMPOSITION
  if(calcul1 <= 1591){
    calcul2 = calcul1
  } else if(calcul1 <= 2006){calcul2 = calcul1 * (1-0.029)
  } else if(calcul1 <= 3476) {calcul2 = calcul1 * (1-0.099)
  } else if(calcul1 <= 8557) {calcul2 = calcul1 * (1-0.20)
  } else {
    calcul2 = calcul1 * (1-0.43)
  }
#CALCUL DU SALAIRE APRES IMPOSITION 
  

  return(calcul2)}

salaire_net(salaire = 2500, tempsw = 1, statut = "cadre")


#shifumi

shifumi <- function() {
  # Demander à l'utilisateur de saisir une valeur
  choix_utilisateur <- readline(prompt = "Choisissez entre pierre, papier ou ciseaux : ")
  
  # Vérifier si l'utilisateur a saisi une valeur valide
  if (choix_utilisateur %in% c("pierre", "papier", "ciseaux")) {
    # Simuler un choix aléatoire pour l'ordinateur
    choix_ordi <- sample(c("pierre", "papier", "ciseaux"), 1)
    
    # Afficher les choix de l'utilisateur et de l'ordinateur
    cat("Votre choix :", choix_utilisateur, "\n")
    cat("Choix de l'ordinateur :", choix_ordi, "\n")
    
    # Retourner le résultat du jeu
    if (choix_utilisateur == choix_ordi) {
      return("Égalité !")
    } else if ((choix_utilisateur == "pierre" & choix_ordi == "ciseaux") |
               (choix_utilisateur == "papier" & choix_ordi == "pierre") |
               (choix_utilisateur == "ciseaux" & choix_ordi == "papier")) {
      return("Vous avez gagné !")
    } else {
      return("L'ordinateur a gagné !")
    }
  } else {
    return("Valeur invalide. Veuillez choisir entre pierre, papier ou ciseaux.")
  }
}

#Test de la fonction
shifumi()


#Exercice 2 - Création des boucles

#pensez à enregistrer avant de lancer une boucle
#éviter les boucles infinis

#1.
resultat = 0
for(i in c(1,2,3,4,5))





















