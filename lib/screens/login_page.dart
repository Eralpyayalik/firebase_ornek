import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void loginUp() async {
    String email = emailController.text;
    String password = passwordController.text;

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Başarılı'),
            content: Text('Giriş işlemi başarıyla tamamlandı.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(context, "/mainpage");
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
            child: Column(children: [
              SizedBox(
                height: 100,
              ),
              Container(
                height: 150.0,
                width: 190.0,
                padding: EdgeInsets.only(top: 40),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200),
                ),
                child: Center(
                    child: Icon(
                  Icons.lock,
                  size: 50,
                )),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                'Giriş Yapın',
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(
                height: 50,
              ),
              TextField(
                controller: emailController,
                decoration: custominputdecoration('Kullanici Adi'),
              ),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: custominputdecoration('Sifre'),
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: loginUp,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF27ae60),
                ),
                child: Text(
                  'Giriş Yap',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pushNamed(context, "/signUp"),
                    child: Text(
                      'Hesap oluşturun',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Sifremi Unuttum',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }

  InputDecoration custominputdecoration(String hintText) {
    return InputDecoration(
        hintStyle: TextStyle(color: Colors.black),
        hintText: hintText,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)));
  }
}
