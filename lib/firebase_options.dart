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
    apiKey: 'AIzaSyCVunzh1U_p9c36JZknaQHltzlInxPN5yA',
    appId: '1:245538844889:web:4ed88f6269c9b26423cec8',
    messagingSenderId: '245538844889',
    projectId: 'quizapp-7ca79',
    authDomain: 'quizapp-7ca79.firebaseapp.com',
    storageBucket: 'quizapp-7ca79.appspot.com',
    measurementId: 'G-RRK7HKZ64N',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCWIEyb4nUR2YWqvfdTlt-S8iYHJFmNtok',
    appId: '1:245538844889:android:ad7c44194a3b680523cec8',
    messagingSenderId: '245538844889',
    projectId: 'quizapp-7ca79',
    storageBucket: 'quizapp-7ca79.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDlx3oefXa9G-qVDGekWl_TmvBmugyXkBQ',
    appId: '1:245538844889:ios:03ac0bd325dc43f723cec8',
    messagingSenderId: '245538844889',
    projectId: 'quizapp-7ca79',
    storageBucket: 'quizapp-7ca79.appspot.com',
    iosBundleId: 'com.example.quiz',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDlx3oefXa9G-qVDGekWl_TmvBmugyXkBQ',
    appId: '1:245538844889:ios:b55cf5e1038b351823cec8',
    messagingSenderId: '245538844889',
    projectId: 'quizapp-7ca79',
    storageBucket: 'quizapp-7ca79.appspot.com',
    iosBundleId: 'com.example.quiz.RunnerTests',
  );
}
