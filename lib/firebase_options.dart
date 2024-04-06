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
    apiKey: 'AIzaSyBRPQ3slviVn6fwZdihr-fVAjE00gbYygM',
    appId: '1:297401791209:web:7a46f0aae74af87457b678',
    messagingSenderId: '297401791209',
    projectId: 'my-diary-5c68e',
    authDomain: 'my-diary-5c68e.firebaseapp.com',
    storageBucket: 'my-diary-5c68e.appspot.com',
    measurementId: 'G-FGEF5V44GV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD0BnnB8CsqEJJDsuGZUoxAC0v89lwJ2NI',
    appId: '1:297401791209:android:cace951a36c6395d57b678',
    messagingSenderId: '297401791209',
    projectId: 'my-diary-5c68e',
    storageBucket: 'my-diary-5c68e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBT5jyQ4Pct6XbluakT2oM0sy9YpYQt9MA',
    appId: '1:297401791209:ios:a1399fe0528c962d57b678',
    messagingSenderId: '297401791209',
    projectId: 'my-diary-5c68e',
    storageBucket: 'my-diary-5c68e.appspot.com',
    iosBundleId: 'com.example.diary',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBT5jyQ4Pct6XbluakT2oM0sy9YpYQt9MA',
    appId: '1:297401791209:ios:4d852d874e7f590457b678',
    messagingSenderId: '297401791209',
    projectId: 'my-diary-5c68e',
    storageBucket: 'my-diary-5c68e.appspot.com',
    iosBundleId: 'com.example.diary.RunnerTests',
  );
}