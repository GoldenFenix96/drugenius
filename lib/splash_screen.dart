import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'Paginas/loggin_page.dart';

import 'main.dart';

/*
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
        return Container(
          child: Center(
            child: Text('hola'),
          ),
        );
      },
    );
  }

  // Marca la función como `async`
  Future<bool> isUserAuthenticated() async {
    var user = FirebaseAuth.instance.currentUser;
    if (user == null) {}
    return user != null;
  }
}
*/

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(MaterialApp(
    home: SplashScreen(),
  ));
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User?>(
      future: FirebaseAuth.instance.authStateChanges().first,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Mientras se verifica la autenticación, muestra un indicador de carga.
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          // Si hay un usuario autenticado, ve a la "Página A", de lo contrario, ve a la "Página B".
          if (snapshot.data != null) {
            Future.delayed(Duration.zero, () {
              Navigator.pushReplacement<void, void>(
                  context,
                  MaterialPageRoute<void>(
                      builder: (BuildContext context) =>
                          const DrugeniusMenu()));
            });
          } else {
            Future.delayed(Duration.zero, () {
              Navigator.pushReplacement<void, void>(
                  context,
                  MaterialPageRoute<void>(
                      builder: (BuildContext context) => const LogginPage()));
            });
          }
          return Container();
        }
      },
    );
  }
}
