# RELEASE_REPORT

## Auteur

Amaury

## Projet

Projet Flutter : `project_ci`

Mise en place d’un processus complet d’automatisation de publication de version stable via GitHub Actions.

---

## Outils utilisés

### release-it

- Utilisé pour gérer l'incrémentation de version, la génération du changelog, la création de tag Git, et la publication de release GitHub.
- Configuration via un fichier `.release-it.json`.

### GitHub CLI (gh)

- Utilisé pour l’authentification avec GitHub et la gestion du token dans les scripts.
- Intégré dans le script `release.sh`.

### Script `release.sh`

- Script centralisant les étapes de publication : tests, versioning, changelog, tag, push, release.
- Exécutable en local ou dans un pipeline CI.

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
- Tag Git `vX.Y.Z` visible sur le dépôt distant
- Ce rapport : `RELEASE_REPORT.md`

---

## Lien vers la release

https://github.com/ton-utilisateur/project_ci/releases

---

## Remarques

Le processus de publication a été testé et validé à travers différents scénarios.  
Tous les tests doivent réussir avant de déclencher la release.  
Le pipeline est stable et opérationnel sur GitHub Actions.
