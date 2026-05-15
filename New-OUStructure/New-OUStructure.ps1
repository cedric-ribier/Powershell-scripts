Import-Module ActiveDirectory

# Racine des OUs User
$rootOU = "OU=User,OU=CreativeFusion,DC=CreativeFusion-Studios,DC=eu"

# Liste des OUs métiers existantes
$departements = @(
    "Compta",
    "Design_Animation",
    "Direction_Général",
    "Info",
    "RH"
)

# Nom du site à ajouter
$site = "Lyon"

foreach ($dept in $departements) {

    # OU parent : OU=Compta, OU=Design_Animation, etc.
    $parentOU = "OU=$dept,$rootOU"

    # Vérifie si l'OU parent existe
    if (-not (Get-ADOrganizationalUnit -LDAPFilter "(ou=$dept)" -SearchBase $rootOU -ErrorAction SilentlyContinue)) {
        Write-Host "L'OU parent $dept n'existe pas, création..." -ForegroundColor Yellow
        New-ADOrganizationalUnit -Name $dept -Path $rootOU
    }

    # Nom de l'OU enfant pour le site
    $newSiteOU = "${dept}_${site}"

    # Création OU du site
    New-ADOrganizationalUnit -Name $newSiteOU -Path $parentOU -ErrorAction SilentlyContinue

    Write-Host "Créé : $newSiteOU dans $parentOU" -ForegroundColor Green
}
