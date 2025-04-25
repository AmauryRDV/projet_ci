project_ci
Projet Flutter de démonstration pour la mise en place d’un processus de publication automatisée.

Objectifs
 . Automatiser la gestion des versions (SemVer)

. Générer automatiquement un changelog

. Taguer les versions dans Git

. Créer des releases publiques sur GitHub

. Intégrer ces étapes dans un pipeline CI

Technologies et outils utilisés
. Flutter

. release-it

. GitHub CLI (gh)

. GitHub Actions

. Bash

Structure du projet
. lib/: Code principal Flutter

. test/: Tests unitaires

. release.sh: Script d'automatisation de release

.release-it.json: Configuration de release-it

.github/workflows/: Pipelines CI

. release.yml: Workflow de release

. CHANGELOG.md: Journal des versions

. RELEASE_REPORT.md: Rapport de publication

Utilisation
En local
Exécuter le script d’automatisation avec la commande suivante :
./release.sh release-it

En CI (GitHub Actions)
Le pipeline CI est configuré dans .github/workflows/release.yml et peut être déclenché :

. Manuellement via l’interface GitHub (workflow_dispatch)

. Automatiquement sur chaque push vers la branche main ou master

Le pipeline effectue les étapes suivantes :

. Vérification des tests

. Incrémentation de version

. Génération du changelog

. Création du tag Git

. Publication de la release sur GitHub