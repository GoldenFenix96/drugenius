// ignore_for_file: empty_constructor_bodies
import 'package:drugenius/Paginas/loggin_page.dart';
//importaciones de FireBase
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // ignore: prefer_is_empty
  if (Firebase.apps.length == 0) {
    await Firebase.initializeApp(
      name: "Drugenius",
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  runApp(const MaterialApp(
    home: LogginPage(),
    debugShowCheckedModeBanner: false,
  ));
}
