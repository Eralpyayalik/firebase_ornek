import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  Future<String?> signUp(String email, String username, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      String uid = userCredential.user!.uid;

      await FirebaseFirestore.instance.collection("Users").doc(uid).set({
        "email": email,
        "username": username,
      });

      return uid;
    } catch (error) {
      print("Hata: $error");
      return null;
    }
  }
}
