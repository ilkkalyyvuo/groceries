import 'package:flutter/material.dart';
import 'package:groceries/common/presentation/home_page.dart';
import 'package:groceries/features/list/presentation/list_page.dart';
import 'package:groceries/features/settings/presentation/settings_page.dart';
import 'package:groceries/routing/app_routes.dart';

class groceries extends StatelessWidget {
  const groceries({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Groceries',
      home: const HomePage(),
      debugShowCheckedModeBanner:
          false, // This line sets HomePage as the home screen
      routes: {
        AppRoutes.list: (context) => const ListPage(),
        AppRoutes.settings: (context) => const SettingsPage(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      ),
    );
  }
}

void main() {
  runApp(const groceries());
}
