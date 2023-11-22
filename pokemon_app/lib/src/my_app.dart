import 'package:flutter/material.dart';
import 'package:pokemon_app/src/views/menu_principal/menu_principal_page.dart';

import 'package:oktoast/oktoast.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme:
                ColorScheme.fromSeed(seedColor: const Color(0xFFDC0A2D)),
            useMaterial3: true,
            textTheme: TextTheme(
              displayLarge: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.w300,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              labelLarge: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ),
          home: const Menu()),
    );
  }
}
