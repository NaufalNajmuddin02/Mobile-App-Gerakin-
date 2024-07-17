import 'package:flutter/material.dart';
import 'package:gerakin_bach3/pages/forgout_passowrd/email_entry_screen.dart';
import 'package:gerakin_bach3/pages/login_screen.dart';
import 'package:gerakin_bach3/pages/register_screen.dart';
import 'package:gerakin_bach3/pages/reset_password.dart';
import 'package:gerakin_bach3/pages/verification_screen.dart';
import 'package:gerakin_bach3/pages/home_screen.dart';
import 'package:gerakin_bach3/pages/deteksi.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/verification': (context) => UserDetailsScreen(),
        '/home': (context) => FirstScreen(),
        '/deteksi': (context) => CameraScreen(),
        '/forgotpassword': (context) => EmailEntryScreen(),
        '/reset_password': (context) => ResetPasswordPage(
            token: ModalRoute.of(context)?.settings.arguments as String),
      },
    );
  }
}
