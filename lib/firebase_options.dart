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
    apiKey: 'AIzaSyBCsb6_ICTLVnx_oyYT7R44i9jQFhmFaBg',
    appId: '1:788141533046:web:9ffb59b78e14eedf3b3c57',
    messagingSenderId: '788141533046',
    projectId: 'learn-firebase-4c8e7',
    authDomain: 'learn-firebase-4c8e7.firebaseapp.com',
    storageBucket: 'learn-firebase-4c8e7.appspot.com',
    measurementId: 'G-FPLM7Y53SD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCSeOHX_Du2t-W4rQxlPySQBRwW_CesEGc',
    appId: '1:788141533046:android:df40d400019802783b3c57',
    messagingSenderId: '788141533046',
    projectId: 'learn-firebase-4c8e7',
    storageBucket: 'learn-firebase-4c8e7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD0XTr3YqZLnGw2dNYLBnW3jF1vNdT-ats',
    appId: '1:788141533046:ios:1ab0ea0d5080f20b3b3c57',
    messagingSenderId: '788141533046',
    projectId: 'learn-firebase-4c8e7',
    storageBucket: 'learn-firebase-4c8e7.appspot.com',
    iosClientId: '788141533046-0319de5ibvujrgrh7j7iuh2sn2bip11e.apps.googleusercontent.com',
    iosBundleId: 'com.example.learnFirebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD0XTr3YqZLnGw2dNYLBnW3jF1vNdT-ats',
    appId: '1:788141533046:ios:1ab0ea0d5080f20b3b3c57',
    messagingSenderId: '788141533046',
    projectId: 'learn-firebase-4c8e7',
    storageBucket: 'learn-firebase-4c8e7.appspot.com',
    iosClientId: '788141533046-0319de5ibvujrgrh7j7iuh2sn2bip11e.apps.googleusercontent.com',
    iosBundleId: 'com.example.learnFirebase',
  );
}
