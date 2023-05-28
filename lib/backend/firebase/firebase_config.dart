import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCjqYF-qo03kFHPA--0_q7YkD4-8mAP-h4",
            authDomain: "mobilebillyproject2023.firebaseapp.com",
            projectId: "mobilebillyproject2023",
            storageBucket: "mobilebillyproject2023.appspot.com",
            messagingSenderId: "960382778332",
            appId: "1:960382778332:web:e29d80560bb7c3a6282d19"));
  } else {
    await Firebase.initializeApp();
  }
}
