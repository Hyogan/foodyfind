import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foodyfind/data/models/restaurants.dart';
import 'package:foodyfind/firebase_options.dart';
import 'package:foodyfind/services/auth/auth_gate.dart';
import 'package:foodyfind/theme/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
     options: DefaultFirebaseOptions.currentPlatform,
   );

    runApp(
      MultiProvider(providers: [
        //theme provider
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        //restaurant notifier
        ChangeNotifierProvider(create: (context) => Restaurant()),
      ],
          child: const MyApp(),
      ),
    );

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
      home: const AuthGate(),
      theme : Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
