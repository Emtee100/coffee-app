import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late FocusNode myFocusNode;
  final _loginFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    // _emailErrorCode = '';
    // _passwordErrorCode = '';
    myFocusNode = FocusNode();
    super.initState();
  }

  bool _emailErrorCode= false;
  bool _passwordErrorCode = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    myFocusNode.dispose();
    super.dispose();
  }


  //sign in method using Google as provider
  Future <UserCredential> signInWithGoogle() async{
    //Triger authentication flow i.e showing list of google accounts and store the data about that account into the variable
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    //get the authentication tokens from the account and store them in the googleAuth runtime constant(final)
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    
    //create a credential 
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }


  // sign in function for email and password
  Future<dynamic> signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        setState(() => _emailErrorCode = true);
      } else{
        setState(() => _emailErrorCode = false);
      }
      
      if (e.code == 'wrong-password') {
        setState(() => _passwordErrorCode = true);
      }
      else{
        setState(() => _passwordErrorCode = false);
      }
      // else if(e.code == 'invalid-email'){

      // }
    }
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
        child: Form(
          key: _loginFormKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 15.0),
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
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextFormField(
                  validator: (value) {
                      if(value == null || value.isEmpty){
                        return "Please enter an email address";
                      }
                      return null;
                    },
                  onEditingComplete: () => myFocusNode.requestFocus(),
                  autofocus: true,
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  style: GoogleFonts.mulish(),
                  decoration: InputDecoration(
                    errorText: _emailErrorCode?"Email not found":null,
                    prefixIcon: const Icon(
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
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFormField(
                    
                    validator: (value) {
                      if(value == null || value.isEmpty){
                        return "Please enter a password";
                      }
                      return null;
                    },
                    style: GoogleFonts.mulish(),
                   focusNode: myFocusNode,
                    cursorColor: Colors.brown,
                    onEditingComplete: () => myFocusNode.unfocus(),
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      errorText: _passwordErrorCode?"Password is incorrect":null,
                        prefixIcon: const Icon(
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
                        onPressed: () => print("Forgot Password"),
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
                onTap: (){
                  
                  if(_loginFormKey.currentState!.validate()){
                    signIn();
                  }
                  
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 133.0, vertical: 18.0),
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
        
              GestureDetector(
                onTap: () => signInWithGoogle(),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 18.0),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(25)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const FaIcon(FontAwesomeIcons.google),
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
              ),
        
              const SizedBox(
                height: 12.0,
              ),
        
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 18.0),
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(25)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const FaIcon(FontAwesomeIcons.facebook),
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
        
              const Text("Don't have an account?")
            ],
          ),
        ),
      ),
    );
  }
}
