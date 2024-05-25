import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodyfind/components/my_button.dart';
import 'package:foodyfind/components/my_textfield.dart';
import 'package:foodyfind/services/auth/auth_service.dart';
import 'package:foodyfind/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  
  
  final void Function()? onTap;
  const RegisterPage({super.key, this.onTap});

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
    final authService = AuthService();
    //Show loading circle

    //Check password and password
    if(passwordController.text != passwordConfirmationController.text)
    {
        //pop loading circle
          Navigator.pop(context);

        //show the errors
          showDialog(
              context: context,
              builder: (context) => const AlertDialog(
                title: Text('Password does not match'),
          ));
    }
    else{
      try{
        await authService.signUpWithEmailPassword(emailController.text, passwordController.text);
      }
      catch(e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(title: Text(e.toString())),
        );
      }

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
                  const SizedBox(height: 25),
                //App name
                  const Text(
                    'F OO DY F I N D',
                    style:  TextStyle(fontSize: 20),
                  ),
                  //Username TextField
                const SizedBox(height: 50),

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

                   MyButton(text: 'Register', onTap: registerUser),
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
        ),
      ),
    );
  }
}