// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyBFjg2tcXRPOMTAE3b3rboMf4yrjwoHaaU',
    appId: '1:822449360925:web:3b24202edca881a479b6f4',
    messagingSenderId: '822449360925',
    projectId: 'sports-47ad1',
    authDomain: 'sports-47ad1.firebaseapp.com',
    storageBucket: 'sports-47ad1.appspot.com',
    measurementId: 'G-W55VXCGWR1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAVpKYC1vo8mXKI7OOIzcDCZZUHaecsL2Y',
    appId: '1:822449360925:android:eb102266aaa9238079b6f4',
    messagingSenderId: '822449360925',
    projectId: 'sports-47ad1',
    storageBucket: 'sports-47ad1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBHIq7rYty7hv7sTJppNZG3zqVOUhgKuVw',
    appId: '1:822449360925:ios:2be841f7340a11d679b6f4',
    messagingSenderId: '822449360925',
    projectId: 'sports-47ad1',
    storageBucket: 'sports-47ad1.appspot.com',
    iosBundleId: 'com.example.gcuApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBHIq7rYty7hv7sTJppNZG3zqVOUhgKuVw',
    appId: '1:822449360925:ios:2be841f7340a11d679b6f4',
    messagingSenderId: '822449360925',
    projectId: 'sports-47ad1',
    storageBucket: 'sports-47ad1.appspot.com',
    iosBundleId: 'com.example.gcuApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBFjg2tcXRPOMTAE3b3rboMf4yrjwoHaaU',
    appId: '1:822449360925:web:886965666fc4a87779b6f4',
    messagingSenderId: '822449360925',
    projectId: 'sports-47ad1',
    authDomain: 'sports-47ad1.firebaseapp.com',
    storageBucket: 'sports-47ad1.appspot.com',
    measurementId: 'G-CD6VMFJG35',
  );
}
