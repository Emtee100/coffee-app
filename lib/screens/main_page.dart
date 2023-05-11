import 'package:coffee_shop/screens/firstscreen.dart';
import 'package:coffee_shop/screens/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}
  
class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const FirstScreen();
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoginPage();
          } 
          // else if (snapshot.connectionState == ConnectionState.active) {
          //   return const LoadingScreen();
          // }
          else {
            return const LoginPage();
           
          }
        },
      ),
    );
  }
}
