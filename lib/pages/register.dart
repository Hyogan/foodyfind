//  import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodyfind/components/my_button.dart';
import 'package:foodyfind/components/my_textfield.dart';
import 'package:foodyfind/helpers/helper_functions.dart';

class RegisterPage extends StatefulWidget {
  
  
  final void Function()? onTap;
  RegisterPage({super.key, this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Text controllers
  final TextEditingController emailController = TextEditingController();

  final TextEditingController usernameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController passwordConfirmationController = TextEditingController();

  // login method
  void registerUser() async {
    //Show loading circle
    showDialog(
      context: context,
      builder: (context) => const Center(
        child : CircularProgressIndicator(),
      ),
    );
    //Check password and password
    if(passwordController.text != passwordConfirmationController.text)
    {
        //pop loading circle
          Navigator.pop(context);

        //show the errors
        displayMessageToUser("Password don't match", context);
    }
    else{
      //Register logic
      // try {
      //   //create the user
      //   UserCredential? userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text);


      //   //pop loading circle
      //   Navigator.pop(context);
      
      // }
      // on FirebaseAuthException catch(e){
      
      //   Navigator.pop(context);
      //   displayMessageToUser(e.code, context);
      // }

    }
  }

  // Text editing Controllers
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body : Center(
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


            //Username TextField
            const SizedBox(height: 50),
            MyTextField(
              hintText: 'Username', 
              obscureText: false, 
              controller: usernameController
            ),
          
            //Email textfield
            const SizedBox(height: 15),
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
            
            //Password confirmation Textfield
            const SizedBox(height: 15,),
            MyTextField(
              hintText: 'Confirm password', 
              obscureText: true, 
              controller: passwordConfirmationController
            ),  
              const SizedBox(height: 25),
            //Sign in button 
            
               MyButton(text: 'Register', onTap: widget.onTap),
               const SizedBox(height: 25),
            //don't  have an account, register here .
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account ?'),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text('Login Here',  style: TextStyle(fontWeight: FontWeight.bold,),),
                  )
                ],
                )
            ]
            
          ),
        ),
        )
    );
  }
}