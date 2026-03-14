## 🚀 Guide de Lancement

### 1. Environnement de Production (Optimisé)
Utilise le **Multi-stage build** pour générer des images légères et sécurisées.
```bash
# Construction et lancement en arrière-plan
# Pour passer en PROD
docker compose down && docker compose up --build

# Lancement avec surcharge de configuration dev
# Pour passer en DEV
docker compose down && docker compose -f docker-compose.yml -f docker-compose.dev.yml up --build

## 🧪 Tests et Validation

Pour garantir la qualité du code, les tests doivent être lancés **dans l'environnement Docker**.

| Composant | Commande d'exécution |
|-----------|---------------------|
| Auth Service | `docker compose exec auth-service npm test` |
| Product Service | `docker compose exec product-service npm test` |
| Order Service | `docker compose exec order-service npm test` |
| Frontend | `docker compose exec frontend npm run test:unit` |

### Exécution manuelle des tests
docker compose exec product-service npm test
docker compose exec order-service npm test
docker compose exec frontend npm run test:unit
docker compose exec auth-service npm test

## 📦 Initialisation des Données

Une fois les services démarrés, injectez les **produits par défaut dans la base de données**.

### Rendre le script exécutable

```bash
chmod +x scripts/init-products.sh

## 🛠️ Concepts Techniques Implémentés

### Multi-stage Builds
Optimisation drastique de la taille des images Docker grâce à l'utilisation d'images **Node Alpine**.

### Isolation Réseau
Les services communiquent entre eux via un **réseau bridge privé**, permettant une isolation et une sécurité accrues.

### Gestion d'Environnement
Utilisation de :

- `env_file` pour la gestion des variables d'environnement
- fichiers **YAML de surcharge** pour adapter la configuration entre développement et production

### Orchestration
Gestion des dépendances entre services avec :


Cela permet d'assurer un **ordre de démarrage cohérent** entre les conteneurs.

---

## 🐧 Déploiement sur Debian 12

Le projet est conçu pour fonctionner **nativement sur un serveur Debian 12** avec **Docker et Docker Compose installés**.

---

## 📋 Récapitulatif des commandes indispensables

Voici les commandes que tu utiliseras le plus souvent durant ton projet.

| Action | Commande |
|------|------|
| Démarrer tout (Prod) | `docker compose up --build -d` |
| Démarrer tout (Dev) | `docker compose -f docker-compose.yml -f docker-compose.dev.yml up` |
| Arrêter tout | `docker compose down` |
| Voir les logs | `docker compose logs -f` |
| Vérifier les conteneurs | `docker compose ps` |
| Redémarrer un service | `docker compose restart <nom_du_service>` |
| Entrer dans un conteneur | `docker compose exec <nom_du_service> sh` |
| Supprimer les volumes | `docker compose down -v` ⚠️ efface les bases de données |

# nettoyage complet 
docker system prune -f