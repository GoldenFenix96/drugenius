import 'package:drugenius/Firebase_Services/firebase_services.dart';
import 'package:drugenius/Paginas/loggin_page.dart';
import 'package:flutter/material.dart';
import 'package:drugenius/Componentes/my_textfield_general.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nombreController = TextEditingController();

  Firebase_services fs = Firebase_services();

  Future<void> _registrarUsuario() async {
    final email = _emailController.text;
    final password = _passwordController.text;
    final nombre = _nombreController.text;

    print('Nombre: $nombre');
    print('Contraseña: $password');
    print('Email: $email');
    try {
      // Obtén el contexto antes de entrar al bloque try-catch
      final currentContext = context;

      // Llama a tu función de registro desde AuthService
      final user = await fs.signUpAndCreateProfile(email, password, nombre);

      if (user != null) {
        // Registro exitoso, redirige a otra pantalla o realiza acciones necesarias
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LogginPage()));
      } else {
        // Registro fallido, muestra un mensaje de error
        ScaffoldMessenger.of(currentContext).showSnackBar(
          const SnackBar(
            content: Text('Ha ocurrido un error al registrar al usuario.'),
          ),
        );
      }
    } catch (e) {
      print('Error al registrar usuario: $e');
      // Maneja el error según tus necesidades
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //LOGO
                SizedBox(
                  width: 350.0,
                  child: Image.asset("assets/images/drugenius_logo.png"),
                ),
                //FIN LOGO

                const SizedBox(height: 50.0),
                //TXT REGISTRO
                const SizedBox(
                  child: Text(
                    "Registro",
                    style: TextStyle(
                        fontSize: 30,
                        //fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w800),
                  ),
                ),
                //FIN TXT REGISTRO
                const SizedBox(height: 30.0),
                //TXT RELLENAR
                const SizedBox(
                  height: 25.0,
                  child: Text(
                    "Rellene los siguientes datos",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      //fontFamily: 'Montserrat',
                      fontSize: 18.0,
                      color: Color(0xffbebcbc),
                    ),
                  ),
                ),
                //FIN TXT RELLERNAR
                const SizedBox(height: 30.0),

                //TXT FIELD NOMBRE

                _myTextFliedName(),
                //FIN TXT FIELD NOMBRE

                const SizedBox(height: 15.0),

                //TXT FIELD CORREO
                _myTextFieldCorreo(),
                //FIN FIELD TXT CORREO

                const SizedBox(height: 15.0),

                //TXT FIELD CONTRASEÑA
                _myTextFieldPassword(),
                //FIN TXT FIELD CONTRASEÑA
                const SizedBox(height: 30.0),
                //BOTÓN
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 25.0,
                  ),
                  child: SizedBox(
                    width: size.width * 1,
                    height: 50.0,
                    child: ElevatedButton(
                      onPressed: () => {
                        _registrarUsuario(),
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
                        "Registrarse",
                        style: TextStyle(
                          //fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                //FIN BOTÓN
                const SizedBox(height: 10.0),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _myTextFliedName() {
    return myTextFieldGeneral(
      controller: _nombreController,
      hintText: "Juan Goméz",
      icon: Icons.person_outlined,
      keyboardType: TextInputType.name,
      labelTxt: "Nombre",
      fontWeight: FontWeight.w700,
      onChanged: (value) {},
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
      fontWeight: FontWeight.w700,
      onChanged: (value) {
        // Actualiza el valor del controlador cuando el usuario escribe en el campo de contraseña
        _passwordController.text = value;
      },
    );
  }
}
