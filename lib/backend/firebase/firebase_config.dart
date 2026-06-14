import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCN-eTRicvvxz6k90tcxcWw_u1obNVUJMc",
            authDomain: "c-o-p-yof-f-a-r-m-a-g-r-7zyapp.firebaseapp.com",
            projectId: "c-o-p-yof-f-a-r-m-a-g-r-7zyapp",
            storageBucket: "c-o-p-yof-f-a-r-m-a-g-r-7zyapp.firebasestorage.app",
            messagingSenderId: "556079579538",
            appId: "1:556079579538:web:8478e925557b660da0c14b"));
  } else {
    await Firebase.initializeApp();
  }
}
