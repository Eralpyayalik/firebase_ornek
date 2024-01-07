import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  SignUpPageState createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void signUp() async {
    String email = emailController.text;
    String password = passwordController.text;
    String username = usernameController.text;

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      String uid = userCredential.user!.uid;

      await FirebaseFirestore.instance.collection("Users").doc(uid).set({
        "username": username,
        "e-mail": email,
      });

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Başarılı'),
            content:
                Text('Kayıt işlemi başarıyla tamamlandı. Kullanıcı ID: $uid'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(context, "/login");
                },
                child: Text('Tamam'),
              ),
            ],
          );
        },
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Hata'),
            content: Text('Kayıt işlemi başarısız. Hata: $e'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Tamam'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF27ae60),
      body: SingleChildScrollView(
        child: Center(
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF2ecc71),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.nature_people,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Kayıt Ol',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: usernameController,
                  decoration: customInputDecoration('Kullanıcı Adı'),
                ),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: emailController,
                  decoration: customInputDecoration('E-mail'),
                ),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: passwordController,
                  decoration: customInputDecoration('Şifre'),
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: signUp,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF27ae60),
                  ),
                  child: Text(
                    'Kayıt Ol',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, "/login");
                  },
                  child: Text(
                    ' Hesabınız var mı  Giriş Yapın',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration customInputDecoration(String hintText) {
    return InputDecoration(
      hintStyle: TextStyle(color: Colors.white),
      hintText: hintText,
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
    );
  }
}
