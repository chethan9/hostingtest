import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAaDnUN2rgHLEyg4V5R43u4YYiIRSsxNoQ",
            authDomain: "demopro-4413c.firebaseapp.com",
            projectId: "demopro-4413c",
            storageBucket: "demopro-4413c.appspot.com",
            messagingSenderId: "585237700565",
            appId: "1:585237700565:web:70862e904611bd74da275c"));
  } else {
    await Firebase.initializeApp();
  }
}
