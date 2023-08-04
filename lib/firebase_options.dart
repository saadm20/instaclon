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
    apiKey: 'AIzaSyCPNT83hUjmeoI_tKKjPrl-4ye2vJopkcU',
    appId: '1:789666783750:web:a5d474449aa3e4f78f1987',
    messagingSenderId: '789666783750',
    projectId: 'instaclon-81edc',
    authDomain: 'instaclon-81edc.firebaseapp.com',
    storageBucket: 'instaclon-81edc.appspot.com',
    measurementId: 'G-NGQ5MJ7C0X',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCld1dc1jBaitO0N9_q-FxDp1tWT9xmlg8',
    appId: '1:789666783750:android:6055876c0ac358ee8f1987',
    messagingSenderId: '789666783750',
    projectId: 'instaclon-81edc',
    storageBucket: 'instaclon-81edc.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAr7QfLsnCIp8POTCeN-H1SJzuPbg-dqtU',
    appId: '1:789666783750:ios:7f0cad339f4342558f1987',
    messagingSenderId: '789666783750',
    projectId: 'instaclon-81edc',
    storageBucket: 'instaclon-81edc.appspot.com',
    iosClientId: '789666783750-4e8f9fr9e170pgph9g7bnumir69se0gm.apps.googleusercontent.com',
    iosBundleId: 'com.example.instaclon',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAr7QfLsnCIp8POTCeN-H1SJzuPbg-dqtU',
    appId: '1:789666783750:ios:a4907785d2c9f7068f1987',
    messagingSenderId: '789666783750',
    projectId: 'instaclon-81edc',
    storageBucket: 'instaclon-81edc.appspot.com',
    iosClientId: '789666783750-fph1fb8712f8h01m98psm9pg06gscnda.apps.googleusercontent.com',
    iosBundleId: 'com.example.instaclon.RunnerTests',
  );
}