# ✨ Mago Merlino ✨

## Features

Generates flutter modules

> Heavily inspired by [very_good_cli](<https://github.com/VeryGoodOpenSource/very_good_cli>)

## Installation

Move the `mago_merlino` file to the root of your project.

In the future:

```sh
dart pub global activate mago_merlino
```

## Commands

* `mago_merlino create-module abc`
Creates a new flutter module project in the root.

* `mago_merlino create-module --path packages/abc`
Creates a new flutter module project in the specified directory.

* `mago_merlino update-module`
Updates the template of the flutter module project

### Building for source

* To run locally:

```sh
dart bin/mago_merlino.dart command_name
```

* For Sproduction release:

```sh
dart2native bin/mago_merlino.dart -o mago_merlino
```
