# backend

[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]
[![Powered by Dart Frog](https://img.shields.io/endpoint?url=https://tinyurl.com/dartfrog-badge)](https://dartfrog.vgv.dev)

Backend for the `flutter_wordle` project.

[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis

## Getting Started

To run the project locally you will need to run a docker instance for the database:

```bash
docker run -p 5432:5432 \
    -e POSTGRES_USER=postgres \
    -e POSTGRES_PASSWORD=postgres \
    -e POSTGRES_DB=myapp \
    -d postgres
```

Then, you can run the following command to start the Dart Frog server:

```bash
dart_frog dev
```

## Endpoints

|   | Method | Description |
|---|--------|-------------|
| `/api/v1/guess` | `POST` | Submit a guess |
| `/api/v1/random` | `GET` | Get a random word |

Note that a generated swagger file is available at `/index.html`.

