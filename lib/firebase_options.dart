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
    apiKey: 'AIzaSyBjrKT6GiAlTQ0PyBz4ph4j2aSjyO6YRJI',
    appId: '1:36194512093:web:2626612123c818eed2ff34',
    messagingSenderId: '36194512093',
    projectId: 'first-project-c34d6',
    authDomain: 'first-project-c34d6.firebaseapp.com',
    storageBucket: 'first-project-c34d6.appspot.com',
    measurementId: 'G-BJ5R4K1RB3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAv6tgYQAwDB_zc-Q3PrNZ4yxYimQR5Akc',
    appId: '1:36194512093:android:aeaf6e5207df333bd2ff34',
    messagingSenderId: '36194512093',
    projectId: 'first-project-c34d6',
    storageBucket: 'first-project-c34d6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBN_EyfpafQy-DLH79QV2OZDRlMJeNxePo',
    appId: '1:36194512093:ios:bf8f0899643ea1edd2ff34',
    messagingSenderId: '36194512093',
    projectId: 'first-project-c34d6',
    storageBucket: 'first-project-c34d6.appspot.com',
    iosBundleId: 'com.shreen.beHealth',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBN_EyfpafQy-DLH79QV2OZDRlMJeNxePo',
    appId: '1:36194512093:ios:422013b487d57060d2ff34',
    messagingSenderId: '36194512093',
    projectId: 'first-project-c34d6',
    storageBucket: 'first-project-c34d6.appspot.com',
    iosBundleId: 'com.shreen.beHealth.RunnerTests',
  );
}
