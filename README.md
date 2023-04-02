![Dart](https://img.shields.io/badge/Dart-2.19.4-green)
<!--[![pub](https://img.shields.io/pub/v/tankerkoenig_dart.svg)](https://pub.dev/packages/tankerkoenig_dart)-->

### spub - Search pub
    A simple dart command line application that opens a browser and redirects to `pub.dev` with given arguments.
    For each argument a new search will happen.

#### Activate
````bash
git clone 
cd spub 
dart pub global activate --source path .
````

#### Usage
Probably it makes sense to make an `alias` 
for the command `dart pub global run` to make you life easier.
````bash
dart pub global run spub args test
````

#### Structure
- entrypoint in `bin/`
- library code in `lib/`
- unit test in `test/`
