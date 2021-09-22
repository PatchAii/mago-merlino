# ✨ Mago Merlino ✨

## Features

Generates flutter feature BLOC/REPO/VIEW

> Heavily inspired by [very_good_cli](<https://github.com/VeryGoodOpenSource/very_good_cli>)

## Installation

Move the `mago_merlino` file to the root of your project.

or

```sh
dart pub global activate -sgit https://github.com/PatchAii/mago-merlino.git
pub run mago_merlino create-feature abc
pub run mago_merlino create-feature abc --path lib/feature/abc
```

## Commands

---

### create-feature

* `pub run mago_merlino create-feature abc`
Creates a new flutter feature project in the root.

* `pub run mago_merlino create-feature --path lib/feature/abc`
Creates a new flutter feature project in the specified directory.

* `pub run mago_merlino update-feature`
Updates the template of the flutter feature project

---

## Building from source

* To run locally:

```sh
dart bin/mago_merlino.dart command_name
```

* For production release:

```sh
dart2native bin/mago_merlino.dart -o mago_merlino
```
