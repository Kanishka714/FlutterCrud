// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDGks1Lcy4m9Oxb8rxffcRMVEbUBsGq2MU',
    appId: '1:702506471201:web:5523dcbc3ea1eaa1617860',
    messagingSenderId: '702506471201',
    projectId: 'crud-f9e87',
    authDomain: 'crud-f9e87.firebaseapp.com',
    storageBucket: 'crud-f9e87.appspot.com',
    measurementId: 'G-GQ1BZTELR0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAVm2xzac44VdmIKZO0d5_e0F8pauf7K-8',
    appId: '1:702506471201:android:c31f3fc934790af6617860',
    messagingSenderId: '702506471201',
    projectId: 'crud-f9e87',
    storageBucket: 'crud-f9e87.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBr30TzE5zZ0o_ZXWfgSfLkTRwj_SuEaes',
    appId: '1:702506471201:ios:51b0d41a23ffd607617860',
    messagingSenderId: '702506471201',
    projectId: 'crud-f9e87',
    storageBucket: 'crud-f9e87.appspot.com',
    iosBundleId: 'com.example.crud',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBr30TzE5zZ0o_ZXWfgSfLkTRwj_SuEaes',
    appId: '1:702506471201:ios:479880df6e4192db617860',
    messagingSenderId: '702506471201',
    projectId: 'crud-f9e87',
    storageBucket: 'crud-f9e87.appspot.com',
    iosBundleId: 'com.example.crud.RunnerTests',
  );
}