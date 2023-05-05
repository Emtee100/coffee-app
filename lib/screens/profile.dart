import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: ElevatedButton(onPressed: (){
        FirebaseAuth.instance.signOut();
      },child: const Text("Sign Out"),),),
    );
  }
}