import 'package:flutter/material.dart';
import 'package:pokemon_app/src/dependencies_injection.dart';
import 'package:pokemon_app/src/my_app.dart';

Future<void> main() async {
  await initDependencies();
  runApp(const MyApp());
}
