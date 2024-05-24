// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodyfind/components/my_button.dart';
import 'package:foodyfind/components/my_textfield.dart';
import 'package:foodyfind/helpers/helper_functions.dart';
import 'package:foodyfind/pages/home.dart';

class LoginPage extends StatefulWidget {

  LoginPage({super.key, required this.onTap });

    
  final void Function()? onTap;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  void login() {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => const HomePage(),
      ));
  }

  // login method
  void loginUser() async {
      widget.onTap!();
      // showDialog(context: context, builder: (context) => const Center(child: CircularProgressIndicator(),) )

      // try {
      //   await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text)
      
      // }
      // on FirebaseException catch(e) {

      //   //Popp a message to user
      //   displayMessageToUser(e.message, context);
      // }
  
      // AuthCredential authCredential = 
      // UserCredential? userCredentials = FirebaseAuth.instance.signInWithCredential(credential)
  }

  // Text editing Controllers
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body : Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 //Logo
                  Icon(
                    Icons.person,
                    size: 80,
                    color : Theme.of(context).colorScheme.inversePrimary,

                  ),
                const SizedBox(height: 25),
              //App name
                Text(
                  'F OO DY F I N D',
                  style: TextStyle(fontSize: 20),
                ),

              //Email textfield
              const SizedBox(height: 50),
              MyTextField(
                hintText: 'Email',
                obscureText: false,
                controller: emailController
              ),

              // PasswordTextfield
              const SizedBox(height: 15,),
              MyTextField(
                hintText: 'Password',
                obscureText: true,
                controller: passwordController
              ),

              //forgot password
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'I forgot my password ',
                    style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
                  )
                ],
                ),
                const SizedBox(height: 25),
              //Sign in button

                 MyButton(text: 'Login', onTap: login),
                 const SizedBox(height: 25),
              //don't  have an account, register here .
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don\'t have an account ? '),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text('Register Here',  style: TextStyle(fontWeight: FontWeight.bold,),),
                    )
                  ],
                  )
              ]

            ),
          )
        ),
      )
    );
  }
}