// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;
import 'package:flutter_dotenv/flutter_dotenv.dart';

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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static FirebaseOptions web = FirebaseOptions(
    apiKey: dotenv.env['WEB_API_KEY'] ?? 'api-key',
    appId: dotenv.env['WEB_APP_ID'] ?? 'app-id',
    messagingSenderId: dotenv.env['WEB_MESSAGING_SENDER_ID'] ?? 'messaging-sender-id',
    projectId: dotenv.env['WEB_PROJECT_ID'] ?? 'project-id',
    authDomain: dotenv.env['WEB_AUTH_DOMAIN'] ?? 'auth-domain',
    storageBucket: dotenv.env['WEB_STORAGE_BUCKET'] ?? 'storage-bucket',
    measurementId: dotenv.env['WEB_MEASUREMENT_ID'] ?? 'measurement-id',
  );

  static FirebaseOptions android = FirebaseOptions(
    apiKey: dotenv.env['ANDROID_API_KEY'] ?? 'api-key',
    appId: dotenv.env['ANDROID_APP_ID'] ?? 'app-id',
    messagingSenderId: dotenv.env['ANDROID_MESSAGING_SENDER_ID'] ?? 'messaging-sender-id',
    projectId: dotenv.env['ANDROID_PROJECT_ID'] ?? 'project-id',
    storageBucket: dotenv.env['ANDROID_STORAGE_BUCKET'] ?? 'storage-bucket',
  );

  static FirebaseOptions ios = FirebaseOptions(
    apiKey: dotenv.env['IOS_API_KEY'] ?? 'api-key',
    appId: dotenv.env['IOS_APP_ID'] ?? 'app-id',
    messagingSenderId: dotenv.env['IOS_MESSAGING_SENDER_ID'] ?? 'messaging-sender-id',
    projectId: dotenv.env['IOS_PROJECT_ID'] ?? 'project-id',
    storageBucket: dotenv.env['IOS_STORAGE_BUCKET'] ?? 'storage-bucket',
    iosBundleId: dotenv.env['IOS_IOS_BUNDLE_ID'] ?? 'ios-bundle-id',
  );
}