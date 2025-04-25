#!/bin/bash

echo "Lancement des tests Flutter"
flutter test

if [ $? -ne 0 ]; then
  echo "❌ Les tests ont échoué. Annulation de la release."
  exit 1
fi

echo "✅ Tous les tests sont passés !"

TOOL=$1

if [ -z "$TOOL" ]; then
  TOOL="release-it"
fi

case $TOOL in
  "release-it")
    echo "📦 Utilisation de release-it..."
    GITHUB_TOKEN=$(gh auth token) npx release-it --ci --no-npm
    ;;
  "semantic-release")
    echo "📦 Utilisation de semantic-release..."
    GITHUB_TOKEN=$(gh auth token) npx semantic-release
    ;;
  "standard-version")
    echo "📦 Utilisation de standard-version..."
    GITHUB_TOKEN=$(gh auth token) npx standard-version --release-as minor
    ;;
  *)
    echo "❓ Outil inconnu. Choisis entre 'release-it', 'semantic-release' ou 'standard-version'."
    exit 1
    ;;
esac

echo "Release effectuée avec succès !"
