# Scripts Set-NetworkDHCP

## Script réalisé dans le cadre de l'ECF

La demande été de réalisé un script pour résoudre un problème d'utilisation et de configuration réseau

> Les utilisateurs créés régulièrement le même type de ticket, en lien avec un problème réseau,
ils ne peuvent se connecter sur l’ordinateur avec leur compte de domaine, car certains
utilisateurs renseignent une adresse IP statique sur l’ordinateur.
On vous demande de mettre en œuvre une GPO permettant d’exécuter un script PowerShell
au démarrage de l’ordinateur afin de mettre la carte réseau en mode DHCP .


J'ai utilisé la commande ``` Get-NetIPInterface``` pour sélectionner l'ensemble des interfaces réseau.

J'ai ensuite trié avec ``` Where-Object { $_.Dhcp -eq "Disabled" -and $_.InterfaceOperationalStatus -eq "Up" }``` 
pour que l'action ne s'applique qu'au interface active, dont le DHCP n'était pas activé, cela pour limité les actions inutile sur des interfaces non active ou déja en DHCP.

Pour ensuite agir ``` ForEach-Object { Set-NetIPInterface -InterfaceIndex $_.InterfaceIndex -Dhcp Enabled }``` ce qui configure les interfaces récupérer plus haut en DHCP.
