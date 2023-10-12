import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'Paginas/loggin_page.dart';

import 'main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: isUserAuthenticated(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data == true) {
            return const DrugeniusMenu(); // Usuario autenticado
          } else {
            return const LogginPage(); // Usuario no autenticado
          }
        }
        // Mientras se verifica la autenticación, puedes mostrar un indicador de carga u otra interfaz de usuario.
        return const CircularProgressIndicator();
      },
    );
  }

  // Marca la función como `async`
  Future<bool> isUserAuthenticated() async {
    var user = FirebaseAuth.instance.currentUser;
    if (user == null){
      
    }
    return user != null;
  }
}
