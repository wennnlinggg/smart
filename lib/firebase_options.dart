// Simplified Firebase options for Android. Update with real values if needed.
import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    return const FirebaseOptions(
      apiKey: 'REDACTED',
      appId: '1:1234567890:android:abcdef123456',
      messagingSenderId: '1234567890',
      projectId: 'ainetzero-27c6f',
      databaseURL: 'https://ainetzero-27c6f-default-rtdb.firebaseio.com',
    );
  }
}
// Generated minimal firebase_options.dart using provided google-services.json
// Only includes Android options. Extend for iOS/web if needed.
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform => android;

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDLHti1A8G0d2SCjahnw9vG9mu_Jvy7vOU',
    appId: '1:15551298055:android:b6ec242d31640fd8db48a2',
    messagingSenderId: '15551298055',
    projectId: 'ainetzero-27c6f',
    storageBucket: 'ainetzero-27c6f.firebasestorage.app',
    databaseURL: 'https://ainetzero-27c6f-default-rtdb.asia-southeast1.firebasedatabase.app',
  );
}
