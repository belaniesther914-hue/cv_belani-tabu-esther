# CV Esther — TP2 de développement mobile

Application Flutter de présentation du CV d’Esther Belani et de gestion de sa famille avec l’API REST fournie pour le TP2. L’application conserve la photo de profil et les pages CV, Famille et Contact. Les comptes et membres créés sont enregistrés par l’API dans MySQL.

## Fonctionnalités

- Inscription et connexion avec vérification des identifiants par l’API.
- Messages d’erreur/succès et indicateurs de chargement.
- Consultation du CV et des coordonnées.
- Liste et détails des membres de famille; ajout, modification et suppression.
- Sélection facultative d’une photo dans la galerie et envoi en multipart/form-data.
- Affichage des photos renvoyées par l’API.

## Technologies

- Flutter et Dart
- API REST PHP et base de données MySQL
- `http` pour les requêtes REST
- `image_picker` pour choisir une photo
- `shared_preferences` pour mémoriser localement l’identifiant et l’e-mail de la session (pas le mot de passe)

## Prérequis et installation

1. Installer Flutter, puis démarrer Apache et MySQL (par exemple avec XAMPP).
2. Installer l’API [api-test](https://github.com/espoirbaraka/api-test) dans `C:\xampp\htdocs\api-test`.
3. Créer la base `api`, importer `api.sql` et configurer le fichier `.env` de l’API selon son README.
4. Depuis le dossier de cette application, installer les dépendances :

   ```powershell
   flutter pub get
   ```

5. Vérifier l’API dans un navigateur à `http://localhost/api-test-main/public/famille-membres`. Une réponse JSON doit être renvoyée.

## Configuration et lancement

L’URL de base par défaut est `http://localhost/api-test-main/public`, selon le nom actuel du dossier dans `C:\xampp\htdocs`. Elle peut être remplacée avec `API_BASE_URL`.

**Navigateur sur le même ordinateur :**

```powershell
flutter run -d edge --dart-define=API_BASE_URL=http://localhost/api-test-main/public
```

**Émulateur Android :** utiliser `10.0.2.2` pour accéder au serveur de l’ordinateur :

```powershell
flutter run -d emulator-5554 --dart-define=API_BASE_URL=http://10.0.2.2/api-test-main/public
```

Sur un téléphone physique, remplacer l’hôte par l’adresse IP locale de l’ordinateur et connecter les deux appareils au même réseau. Pour une application Web, l’API doit aussi autoriser les requêtes CORS.

## Contrat API utilisé

L’application suit le [README de l’API](https://github.com/espoirbaraka/api-test) :

- Comptes : `POST /accounts/register` et `POST /accounts/login` avec `{ "email": "...", "password": "..." }`.
- Famille : `GET /famille-membres`, `GET /famille-membres/{id}`, `POST /famille-membres`, `PUT /famille-membres/{id}` et `DELETE /famille-membres/{id}`.
- Les membres contiennent `nom`, `postnom`, `prenom`, `lieu_naissance`, `date_naissance` (`AAAA-MM-JJ`) et `parente`. La photo est facultative, au format accepté par l’API, et limitée à 2 Mo.
- Une modification avec une nouvelle photo utilise `POST /famille-membres/{id}` en multipart/form-data; sans nouvelle photo, l’application utilise `PUT` en JSON.

L’API actuelle ne délivre pas de jeton et ne protège pas les routes de la famille par une authentification. L’application ne donne accès à ses écrans qu’après une connexion API réussie, mais la protection des routes côté serveur nécessite une évolution de l’API.

## Captures d’écran

Les captures de l’interface doivent être ajoutées après le lancement de l’application et de l’API. Prévoir au minimum les vues **CV**, **Famille** (avec photos) et **Contact**, puis les référencer ici.

## Vidéo de démonstration

[Voir la démonstration de l’application CV Esther](presentation/demo-cv-esther.mp4)

La vidéo présente l’inscription, la connexion, l’ajout, la consultation, la modification et la suppression d’un membre de famille.

## Vérification

```powershell
flutter analyze
flutter test
```
