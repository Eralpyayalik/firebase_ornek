import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/user_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 250,
            ),
            Text(
              'Hos Geldin',
              style: TextStyle(
                  color: Colors.white60,
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
            ),
            UserProfileWidget()
          ],
        ),
      ),
    );
  }
}
