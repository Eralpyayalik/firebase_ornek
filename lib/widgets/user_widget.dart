import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProfileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return user != null
        ? Column(
            children: [
              Text(
                'E-mail: ${user.email}',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ],
          )
        : Text('Kullanıcı bilgileri yüklenemedi.');
  }
}
