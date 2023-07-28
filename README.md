
# Test 12p5 Backend

## Description

Ce projet est une application de location de vélos. Les utilisateurs peuvent s'inscrire, choisir un vélo à partir de différentes options, et souscrire à un abonnement de location.

## Installation et configuration

### Prérequis

Vous aurez besoin de Ruby et de Rails installés sur votre machine. De plus, vous aurez besoin de PostgreSQL pour la base de données.

### Installation

1. Clonez ce dépôt sur votre machine locale
```
git clone <url de votre dépôt>
```
2. Allez dans le répertoire du projet
```
cd <nom du projet>
```
3. Installez les dépendances nécessaires
```
bundle install
```
4. Créez la base de données, migrez les schémas et chargez les données de la graine.
```
rails db:create db:migrate db:seed
```
5. Lancez le serveur Rails
```
rails server
```
6. Vous pouvez maintenant accéder à l'application à `localhost:3000` dans votre navigateur.

## Fonctionnalités

- Inscription et authentification des utilisateurs
- Visualisation des vélos
- Souscription à des abonnements de location
- Interface d'administration pour la gestion des abonnements

## Auteurs

- Nicolas RIERA

