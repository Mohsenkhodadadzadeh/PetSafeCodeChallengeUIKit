# PetSafeCodeChallengeUIKit

PetSafeCodeChallengeUIKit project is compatible with iOS and iPadOS 14.0 and more. this readme was conducted to explain all parts of code that are developed for the project. forgive me if I didn’t spend time for the appearance, I focused on the code ( if you feel I must do it keep me inform to redesign it by a view and some attractive effects same as Lottie animations :) ), the project comprises three targets : main target, Unit test cases target and also UITest target.

## Prepare for run

this app needs an access key to communicate with the API server and this key is defiend as an `Environment Variable`, so for using the app you must define your access key with the following steps:

- from XCode menu go to `Product` -> `Scheme` -> `Edit Scheme ...`
- select `Run` from the left list
- goto `Arguments` tab from the top tabs
- add an `Environment Variable` with these properties : name = `access_key` , value = your access key token.

![Environment variable](https://github.com/Mohsenkhodadadzadeh/PetSafeCodeChallengeUIKit/blob/Master/ReadmeImages/envvar.png)


## Architecture pattern and design patterns:
the project is developed by VIPER as the Architecture pattern and a couple of design patterns are used for some specific purposes, a chain of responsibility pattern to handle HTTP response, a couple of delegate pattern for communicating between viewcontrollers, and a Singleton pattern to share full name of a symbol.

## project’s sections

### Structure Directory:
this directory comprises all protocols which use for VIPER patterns, `AnyRouter`, `AnyPresenter`, `AnyInteractor`, and `AnyView`

### Entities:
this directory includes all entities that use on the project `GenericEntity`, `SymbolsEntity`, `RatesEntity`, and `BaseEntity` are in this directory.


### App direcory:
it has 3 subdirectories :

- `Exchange` : this directory comprise all files related to the main View
- `NameOfCurrencies`: this direcory uses to keep files for changing base currency.
- `Symbols`: this directory uses to keep files related to convert symbols to full name for currencies.

## Services
This directory includes HTTP response handler ( chain network), call and getting external data from an API (network class), custom network errors ( NetworkErrors)


