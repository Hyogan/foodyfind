// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodyfind/components/my_button.dart';
import 'package:foodyfind/components/my_textfield.dart';
import 'package:foodyfind/helpers/helper_functions.dart';
import 'package:foodyfind/pages/home.dart';
import 'package:foodyfind/services/auth/auth_service.dart';
import 'package:foodyfind/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {

  const LoginPage({super.key, required this.onTap });

    
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
    final authService = AuthService();


    //try sign in
    try {
      await authService.signInWithEmailPassword(emailController.text, passwordController.text);
    }
    //display errors

    catch (e) {
      displayMessageToUser("${e.toString()} ",context);
    }


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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Dark Mode",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),
                    CupertinoSwitch(
                      value: Provider.of<ThemeProvider>(context,listen : false).isDarkMode,
                      onChanged: (value) =>
                        Provider.of<ThemeProvider>(context,listen : false).toggleTheme(),

                    ),
                  ],
                ),
                const SizedBox(height: 25),
              //App name
                const Text(
                  'F OO DY F I N D',
                  style:  TextStyle(fontSize: 20),
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

                 MyButton(text: 'Login', onTap: loginUser),
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