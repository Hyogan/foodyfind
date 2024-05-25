import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodyfind/components/my_drawer_tile.dart';
import 'package:foodyfind/pages/settings.dart';
import 'package:foodyfind/services/auth/auth_service.dart';
import 'package:foodyfind/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatelessWidget {
const MyDrawer({super.key});

  void logout(){
    final authService = AuthService();
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Icon(
              Icons.lock_open_rounded,
                size: 80,
                color : Theme.of(context).
                colorScheme.inversePrimary
              ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(color: Theme.of(context).colorScheme.secondary),
          ),
          MyDrawerTile(text: "H O M E",icon: Icons.home, onTap: (){}),
          MyDrawerTile(text: "S E T T I N G S", icon: Icons.settings, onTap: (){
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsPage()));
          }),
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
            const Spacer(),
    //Logout List tile
        MyDrawerTile(text: "L O G O U T ", icon: Icons.logout, onTap: logout),
        const SizedBox(height:25),
    ]),
    );
  }
}