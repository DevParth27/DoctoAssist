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
    apiKey: 'AIzaSyDAcHSGX7Hq_TXVcbWm7ZqvgSgaNcERxtY',
    appId: '1:966143823204:web:212ff7968ed7128ddd3e71',
    messagingSenderId: '966143823204',
    projectId: 'uba-doctor-svpcet',
    authDomain: 'uba-doctor-svpcet.firebaseapp.com',
    storageBucket: 'uba-doctor-svpcet.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyALjpV5apn8XE-yzpbg6rSOkXfiAb0LP58',
    appId: '1:966143823204:android:ca8e48ca3a4bd077dd3e71',
    messagingSenderId: '966143823204',
    projectId: 'uba-doctor-svpcet',
    storageBucket: 'uba-doctor-svpcet.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAQLvkQD17lJO8j7I4hwQP-NOcIsiyZlcc',
    appId: '1:966143823204:ios:f01e62b86fe737ebdd3e71',
    messagingSenderId: '966143823204',
    projectId: 'uba-doctor-svpcet',
    storageBucket: 'uba-doctor-svpcet.firebasestorage.app',
    iosBundleId: 'com.example.ubaDoctor',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAQLvkQD17lJO8j7I4hwQP-NOcIsiyZlcc',
    appId: '1:966143823204:ios:f01e62b86fe737ebdd3e71',
    messagingSenderId: '966143823204',
    projectId: 'uba-doctor-svpcet',
    storageBucket: 'uba-doctor-svpcet.firebasestorage.app',
    iosBundleId: 'com.example.ubaDoctor',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDAcHSGX7Hq_TXVcbWm7ZqvgSgaNcERxtY',
    appId: '1:966143823204:web:c16e5e56871c59b3dd3e71',
    messagingSenderId: '966143823204',
    projectId: 'uba-doctor-svpcet',
    authDomain: 'uba-doctor-svpcet.firebaseapp.com',
    storageBucket: 'uba-doctor-svpcet.firebasestorage.app',
  );
}
