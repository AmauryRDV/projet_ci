# RELEASE_REPORT

## Projet

Projet Flutter : `project_ci`

Mise en place d’un processus complet d’automatisation de publication de version stable via GitHub Actions.

---

## Outils utilisés

### release-it

- Utilisé pour gérer l'incrémentation de version, la génération du changelog, la création de tag Git, et la publication de release GitHub.
- Configuration via un fichier `.release-it.json`.

#### Forces :

- Outil tout-en-un pour gérer les versions, changelog, tags, et releases.
- Prise en charge d’une large variété de plateformes (GitHub, GitLab, etc.).
- Configuration flexible via un fichier JSON.

#### Faiblesses : 

- Peut nécessiter une bonne configuration initiale, surtout pour l'intégration avec des outils tiers comme GitHub.
- Parfois un peu trop automatisé, ce qui peut rendre difficile la personnalisation du flux de travail selon des besoins spécifiques.
- 
### GitHub CLI (gh)

- Utilisé pour l’authentification avec GitHub et la gestion du token dans les scripts.
- Intégré dans le script `release.sh`.

#### Forces :

- Utilisation native avec GitHub, très pratique pour la gestion de tokens et de releases directement depuis la ligne de commande.
- Prise en charge de nombreuses opérations GitHub sans passer par l'interface web.
- Simple à configurer, surtout pour l’authentification et la gestion des releases.

#### Faiblesses :

- Nécessite une bonne configuration au début, surtout pour l’authentification.
- Moins de flexibilité dans la gestion de projets multiples (si tu as plusieurs projets GitHub ou des configurations complexes).

### Script `release.sh`

- Script centralisant les étapes de publication : tests, versioning, changelog, tag, push, release.
- Exécutable en local ou dans un pipeline CI.

#### Forces : 

- Permet une grande personnalisation en intégrant plusieurs outils (comme release-it, semantic-release, etc.).
- Facile à comprendre et à étendre avec de nouveaux outils ou étapes.
- Permet de centraliser tout le processus de publication dans un seul fichier exécutable.

#### Faiblesses :

- Peut devenir complexe si tu veux gérer plusieurs outils ou configurations différentes.
- Le script peut devenir difficile à maintenir si des étapes sont ajoutées fréquemment ou si le processus change souvent.

---

## Étapes automatisées

- Vérification des tests avec `flutter test`.
- Blocage de la release en cas d’échec.
- Incrémentation automatique de la version.
- Génération du changelog.
- Création d’un tag Git.
- Publication de la release sur GitHub.

---

## Intégration CI

- Intégré via GitHub Actions.
- Déclenchement manuel via `workflow_dispatch` ou automatiquement sur `main`.
- Fichier de workflow : `.github/workflows/release.yml`.

---

## Livrables

- Script : `release.sh`
- Workflow CI : `.github/workflows/release.yml`
- Changelog : `CHANGELOG.md`
- Release publique visible sur GitHub avec changelog intégré
- Tag Git visible sur le dépôt distant
- Ce rapport : `RELEASE_REPORT.md`

---

## Lien vers la release

[https://github.com/AmauryRDV/project_ci/releases](https://github.com/AmauryRDV/projet_ci/releases)

---

##Retour sur le script final
Le script release.sh centralise les étapes de publication et permet de choisir l'outil utilisé pour le processus. Intégré dans le pipeline CI via GitHub Actions, il automatise l'ensemble du cycle de publication.

Points forts :
Flexibilité : Il permet de choisir l'outil de publication (release-it, semantic-release, standard-version).
Sécurité : Avant de procéder à la publication, une vérification des tests est effectuée. Si des tests échouent, la publication est bloquée.
Automatisation : La création automatique des tags et des changelogs simplifie grandement le processus.

Points à améliorer :
Gestion des erreurs : Le script pourrait être amélioré pour mieux gérer les erreurs, notamment en cas d'échec ou de mauvaise configuration des outils.
Extensions : Le script peut être étendu pour intégrer de nouveaux outils de versionnement ou de publication si nécessaire.

Dans l'ensemble, le script est efficace et permet de gagner du temps dans la gestion des versions et des releases. Cependant, il peut être amélioré pour renforcer sa robustesse et sa flexibilité.

