import 'package:drugenius/Clases/id_usuarios.dart';
import 'package:drugenius/Firebase_Services/firebase_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:drugenius/Paginas/register_page.dart';
import 'package:drugenius/Paginas/recover_password.dart';
import 'package:drugenius/Componentes/my_textfield_general.dart';
import 'package:drugenius/main.dart';
import 'package:flutter/services.dart';

final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();

Firebase_services fs = Firebase_services();

class LogginPage extends StatelessWidget {
  const LogginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Center(child: Text("")),
        backgroundColor: const Color.fromARGB(0, 255, 255, 255),
        elevation: 0,
      ),
      body: Container(
        //FONDO
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromRGBO(255, 255, 255, 1),
              Color.fromRGBO(253, 200, 66, 0.143),
            ],
            stops: [0.1, 0.9],
          ),
        ),
        //FIN FONDO
        child: ListView(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //LOGO
                  SizedBox(
                    width: 350.0,
                    child: Image.asset("assets/images/drugenius_logo.png"),
                  ),
                  //FIN LOGO
                  const SizedBox(height: 50.0),
                  //TXT INICIO DE SESIÓN
                  const SizedBox(
                    child: Text(
                      "Inicio de sesión",
                      style: TextStyle(
                        fontSize: 30,
                        //fontFamily: "Montserrat",
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  //FIN TXT INICIO DE SESIÓN
                  const SizedBox(height: 30.0),
                  //TXT BIENVENIDA
                  const SizedBox(
                    height: 25.0,
                    child: Text(
                      "¡Bienvenido! Ingrese sus datos",
                      style: TextStyle(
                        //fontFamily: 'Montserrat',
                        fontSize: 18.0,
                        color: Color(0xffbebcbc),
                      ),
                    ),
                  ),
                  //FIN TXT BIENVENIDA
                  const SizedBox(height: 30.0),
                  //TXT FIELD CORREO
                  _myTextFieldCorreo(),
                  //FIN TXT FIELD CORREO
                  const SizedBox(height: 15.0),
                  //TXT FIELD CONTRASEÑA
                  _myTextFieldPassword(),
                  //FIN TXT FIELD CONTRASEÑA
                  const SizedBox(height: 30.0),
                  //TXT RECUPERACION DE CONTRASEÑA
                  SizedBox(
                    child: InkWell(
                      onTap: () {
                        // Navegar a la página de registro cuando se toque el texto
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RecoverPassword(),
                          ),
                        );
                      },
                      child: SizedBox(
                        width: size.width * 0.85,
                        child: const Align(
                          alignment: Alignment.centerRight,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              '¿Olvidaste tu contraseña?',
                              style: TextStyle(
                                //fontFamily: 'Montserrat',
                                fontSize: 15.0,
                                color: Color.fromARGB(255, 77, 77, 77),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  //FIN TXT RECUPERACION DE CONTRASEÑA

                  const SizedBox(height: 30.0),
                  //BOTÓN
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 25.0,
                    ),
                    child: SizedBox(
                      width: size.width * 1,
                      height: 55.0,
                      child: ElevatedButton(
                        onPressed: () {
                          _singUp(context);
                        },
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  10.0), // Cambia el radio de la esquina para personalizar la forma
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromRGBO(253, 200, 66, 1),
                          ),
                        ),
                        child: const Text(
                          "Iniciar sesión",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              //fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                  //FIN BOTÓN
                  const SizedBox(height: 50.0),
                  //REGISTRO
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "¿No tienes cuenta? ",
                          style: TextStyle(
                            fontSize: 15.0,
                            //fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Color(0xffbebcbc),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            // Navegar a la página de registro cuando se toque el texto
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RegisterPage(),
                              ),
                            );
                          },
                          child: const Text(
                            'Regístrate aquí',
                            style: TextStyle(
                              //fontFamily: 'Montserrat',
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 77, 77, 77),
                              decoration:
                                  TextDecoration.underline, // Subraya el texto
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //FIN REGISTRO
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _myTextFieldCorreo() {
    return myTextFieldGeneral(
      controller: _emailController,
      hintText: "ejemplo@test.com",
      icon: Icons.email_outlined,
      keyboardType: TextInputType.emailAddress,
      labelTxt: "Correo electrónico",
      fontWeight: FontWeight.w700,
      onChanged: (value) {},
    );
  }

  _myTextFieldPassword() {
    return myTextFieldGeneral(
      controller: _passwordController,
      icon: Icons.lock_outline_rounded,
      labelTxt: "Contraseña",
      obscureText: true,
      onChanged: (value) {},
      fontWeight: FontWeight.w700,
    );
  }

  Future<bool> _singUp(BuildContext context) async {
    String email = _emailController.text;
    String pass = _passwordController.text;

    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Debe ingresar un correo electrónico'),
        ),
      );
      return true;
    } else {
      if (pass.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Debe ingresar una contraseña'),
          ),
        );
        return true;
      }
    }

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    User? user = await fs.singInWithEmailAndPassword(email, pass);

    if (user != null) {
      Navigator.pop(context);
      UserStateManager().userId = user.uid; // Guarda el ID del usuario
      print("Inicio de sesión exitoso");
      Navigator.pushReplacement<void, void>(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => const DrugeniusMenu(),
        ),
      );
      //Navigator.popUntil(context, ModalRoute.withName('/DrugeniusMenu'));
    } else {
      Navigator.pop(context);
      showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                title: const Text('Error'),
                content: const Text('No se pudo iniciar sesión'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Aceptar'),
                    child: const Text('Aceptar'),
                  ),
                ],
              ));
      return true;
      //print("Ocurrió un error");
    }
    //await new Future.delayed(const Duration(seconds: 1));
    return true;
  }
}
