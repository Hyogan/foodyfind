import 'package:flutter/material.dart';
// import 'package:foodyfind/firebase_options.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:foodyfind/pages/register.dart';
import 'package:foodyfind/auth/login_or_register.dart';
// import 'package:foodyfind/theme/dark_mode.dart';
import 'package:foodyfind/theme/light_mode.dart';
import 'package:foodyfind/theme/theme_provider.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginOrRegister(),

      // darkTheme: darkMode,
      // theme: Provider.of<ThemeProvider>(context).themeData,
      theme : lightMode
    );
  }
}
