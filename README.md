<p align="center">
    <img src="assets/launcher_icons/icon_transparent.png" alt="Flutter Wordle icon" height="200">
</p>

<h1 align="center">Flutter Wordle</h1>


Wordle game made in Flutter.

## Run locally

You first need to run the backend server in the `backend` directory. You'll have to run a docker instance for the PostgreSQL database and then start the backend using the [dart_frog_cli](https://pub.dev/packages/dart_frog_cli):

```bash
docker run -p 5432:5432 \
    -e POSTGRES_USER=postgres \
    -e POSTGRES_PASSWORD=postgres \
    -e POSTGRES_DB=myapp \
    -d postgres
```

```bash
dart_frog dev
```

This will start the server on `localhost:8080`.

Then, you can run the Flutter app in the root directory. You can do this by running the following command:

```bash
flutter run --dart-define-from-file=configs/dev.json
```