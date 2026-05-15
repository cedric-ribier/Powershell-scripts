# PowerShell Scripts

> Collection de scripts PowerShell d'administration et d'automatisation — Active Directory, réseau, système Windows.

![Status](https://img.shields.io/badge/Status-En_cours-orange?style=flat-square)
![PowerShell](https://img.shields.io/badge/PowerShell-5.1_·_7.x-5391FE?style=flat-square&logo=powershell&logoColor=white)
![Windows Server](https://img.shields.io/badge/Windows_Server-2022-0078D4?style=flat-square)
![Active Directory](https://img.shields.io/badge/Active_Directory-AD_DS-0078D4?style=flat-square)

---

## Contexte

Scripts développés dans le cadre de labs d'infrastructure virtualisés sous GNS3.  
Chaque script répond à un besoin concret d'automatisation rencontré en environnement professionnel simulé.

---

## Scripts disponibles

| Script | Dossier | Description | Contexte |
|---|---|---|---|
| [`Creation_Utilisateurs_Auto.ps1`](./Automatisation-création-users-csv/Creation_Utilisateurs_Auto.ps1) | `Automatisation-création-users-csv/` | Création automatique de comptes AD depuis un fichier Excel — respect de l'arborescence OUs, ajout aux groupes de sécurité, fichier de réponse | Lab TSSR — CreativeFusion Studios |
| [`Set-NetworkDHCP.ps1`](./Set-NetworkDHCP/Set-NetworkDHCP.ps1) | `Set-NetworkDHCP/`|Forcer la carte réseau en mode DHCP via GPO au démarrage | Lab TSSR — CreativeFusion Studios | 
| [`New-OUStructure.ps1`](./New-OUStructure/New-OUStructure.ps1) | `New-OUStructure.ps1/` | Création automatique d'OUs par site depuis un fichier de configuration | Lab TSSR — CreativeFusion Studios |
---

## Structure type d'un script

Chaque script suit le même en-tête de documentation :

```powershell
<#
.SYNOPSIS
    Description courte du script.

.DESCRIPTION
    Description détaillée du fonctionnement et du contexte d'utilisation.

.PARAMETER NomParametre
    Description du paramètre.

.EXAMPLE
    .\NomScript.ps1 -Parametre valeur
    Description de l'exemple.

.NOTES
    Auteur  : Cédric Ribier
    Version : 1.0
    Date    : 2026
#>
```

---

## Prérequis

- PowerShell 5.1 ou 7.x
- Module `ActiveDirectory` — inclus avec les RSAT ou Windows Server
- Module `ImportExcel` — pour les scripts manipulant des fichiers `.xlsx`

```powershell
# Installer le module ImportExcel si nécessaire
Install-Module -Name ImportExcel -Scope CurrentUser
```

---

## Politique d'exécution

Les scripts nécessitent une politique d'exécution adaptée :

```powershell
# Vérifier la politique actuelle
Get-ExecutionPolicy

# Autoriser les scripts signés ou locaux
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

---

> Scripts testés en environnement virtualisé GNS3 — Windows Server 2022 / Active Directory CreativeFusion-Studios.eu  
> Dernière mise à jour : avril 2026
