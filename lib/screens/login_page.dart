import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    // TODO: implement initState
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.brown,
        title: Text(
          "Log in",
          style: GoogleFonts.mulish(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.0, top: 15.0),
              child: Text(
                "Login to your account",
                style: GoogleFonts.mulish(
                    fontSize: 40, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.mail,
                    color: Colors.grey,
                  ),
                  hintText: "Enter your email",
                  hintStyle: GoogleFonts.mulish(color: Colors.grey),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
            ),
            const SizedBox(
              height: 14.0,
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.grey,
                      ),
                      hintText: "Enter your password",
                      hintStyle: GoogleFonts.mulish(color: Colors.grey),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(value: true, onChanged: (value) {}),
                      Text(
                        "Remember me",
                        style: GoogleFonts.mulish(),
                      )
                    ],
                  ),
                  TextButton(
                      onPressed: () => print("Forgot password"),
                      child: Text(
                        "Forgot password",
                        style: GoogleFonts.mulish(),
                      )),
                ],
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            GestureDetector(
              onTap: () => signIn(),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 133.0, vertical: 18.0),
                decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(30.0)),
                child: Text(
                  "Sign in",
                  style: GoogleFonts.mulish(color: Colors.white, fontSize: 18),
                ),
              ),
            ),

            const SizedBox(
              height: 20.0,
            ),

            // Other authentication options

            Container(
              margin: EdgeInsets.symmetric(horizontal: 18.0),
              padding: EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(25)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FaIcon(FontAwesomeIcons.google),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Continue with Google",
                    style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(
              height: 12.0,
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 18.0),
              padding: EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(25)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FaIcon(FontAwesomeIcons.facebook),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Continue with Facebook",
                    style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(
              height: 50,
            ),

            // Register account text

            Text("Don't have an account?")
          ],
        ),
      ),
    );
  }
}
