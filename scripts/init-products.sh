#!/bin/bash

# Attendre que le service product soit disponible
echo "Attente du service product..."
sleep 10

# En DEV : utilise localhost:3000
# En PROD : utilise http://178.62.80.196
API_URL=${1:-"http://localhost:3000"}

create_product() {
    # On teste si on est en direct (port 3000) ou via Nginx (port 80)
    if [[ "$API_URL" == *"3000"* ]]; then
        # Route DIRECTE (Dev)
        TARGET_URL="${API_URL}/api/products"
    else
        # Route via NGINX (Prod)
        TARGET_URL="${API_URL}/api/products/"
    fi

    curl -s -X POST "$TARGET_URL" \
        -H "Content-Type: application/json" \
        -H "Authorization: Bearer efrei_super_pass" \
        -d "{
            \"name\": \"$1\",
            \"price\": $2,
            \"description\": \"$3\",
            \"stock\": $4
        }"
    echo " -> Tentative sur $TARGET_URL pour $1"
}
echo "Création des produits..."

# Création de plusieurs produits
create_product "Smartphone Galaxy S21" 899 "Dernier smartphone Samsung avec appareil photo 108MP" 15
create_product "MacBook Pro M1" 1299 "Ordinateur portable Apple avec puce M1" 10
create_product "PS5" 499 "Console de jeu dernière génération" 5
create_product "Écouteurs AirPods Pro" 249 "Écouteurs sans fil avec réduction de bruit" 20
create_product "Nintendo Switch" 299 "Console de jeu portable" 12
create_product "iPad Air" 599 "Tablette Apple avec écran Retina" 8
create_product "Montre connectée" 199 "Montre intelligente avec suivi d'activité" 25
create_product "Enceinte Bluetooth" 79 "Enceinte portable waterproof" 30

echo "Initialisation des produits terminée !"