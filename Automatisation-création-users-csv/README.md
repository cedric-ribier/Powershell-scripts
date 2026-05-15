# Scripts Utilisateurs

## Rédiger dans le cadre de mon dossier professionnel TSSR.

Contexte, réaliser un script d'automatisation pour l'activité 2 compétence 6 " Automatiser des tâches à l'aide de script "

J'ai donc envisagé un script PowerShell pouvant automatiser la création d'utilisateur AD, par le biais du Planificateur de tâches et ne nécessitant aucune manipulation humaine du fichier en dehors du remplissage par le service RH. 

La tâche plannifier s’exécute 2 fois par jours, elle lance le script qui va agir de cette manière:

- Récupére les données du fichier .xls
- Traiter les données : Suppression des accents ; Service convertie en OU existante et Groupe de sécurité.
- Crée les utilisateurs.
- Les places dans la bonne OU et le groupe de sécurité de l'OU.
- Génére un fichier de réponse pour le service RH avec information des utilisateurs créer.
- Vide le fichier source.

Chacune de ces actions est vérifier au sein du script, et recois des instructions, l'utilisateur existe -> exit, l'OU et groupe n'existe pas -> Création.

Un grand merci à **Stephane MORIN** pour son expertise et le temps précieux qu'il m'as accorder.
