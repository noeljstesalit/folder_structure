import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Login/Login_Page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ad Connect',
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
