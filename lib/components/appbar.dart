import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Appbar extends StatelessWidget {
  const Appbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Good Morning",
                  style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w300,
                      fontSize: 14,
                      color: Colors.grey.shade500)),
              Text(
                  FirebaseAuth.instance.currentUser!.displayName != null
                      ? "${FirebaseAuth.instance.currentUser!.displayName} 👋"
                      : "User 👋",
                  style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w800, fontSize: 18))
            ],
          ),
          Container(
              child: FirebaseAuth.instance.currentUser?.photoURL != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        "${FirebaseAuth.instance.currentUser!.photoURL}",
                        width: 40,
                        height: 40,
                      ))
                  : const Icon(
                      Icons.account_circle,
                      size: 50,
                    ))
        ],
      ),
    );
  }
}
