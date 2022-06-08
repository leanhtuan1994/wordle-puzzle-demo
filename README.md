
WORDLE PUZZLE GAME
====================================================

## 🚀  How to play

Guess the WORDLE in six tries.

Each guess must be a valid five-letter word. Hit the enter button to submit.

After each guess, the color of the tiles will change to show how close your guess was to the word.


## Play on Web
Visit [WEB DEMO](https://wordle-puzzle-demo.web.app/) to play the online version

## Play on Android
Download .apk file in the release page

## 📦 Getting started

Application using Flutter 2.10.5 & Dark SDK > 2.5 & null-safety, to check your flutter sdk using: 

```base 
flutter --version
flutter upgrade
flutter doctor
```

- Clean & install dependencies: 

```base 
flutter clean
flutter pub get
```

- Generate Dart to 

```base
flutter pub run build_runner build --delete-conflicting-outputs
```

- Running the app: 

```base
flutter run ios | flutter run android | flutter run -d chrome
```

## 👨‍🦯 Working flow 

### Generate [Bloc](https://bloclibrary.dev/)

### Generate JSON to DART class 
- Using [Json To Dart Extension](https://marketplace.visualstudio.com/items?itemName=hirantha.json-to-dart)
- To customize your classes is very easy. If you want fast to create a simple class then just click enter continue to skip all methods. Otherwise, build your own. To generate Freezed class and Json Serializable choose Code Generation. Of course, you can set up your configuration in the Settings/Extensions/JSON To Dart Model
- Step: 
    - Copy your json to clipboard
    - `Cmd + Shift + P` => Select `JSON to Dart: From Clipboard to Code Generation Class`
    - Select folder wanna save model 

### REST API using [Retrofit](https://pub.dev/packages/retrofit)

- Create Class @RestApi at `data/remote/***`
- Define method
- Generate `flutter pub run build_runner build --delete-conflicting-outputs` 

<br />
<br/>


