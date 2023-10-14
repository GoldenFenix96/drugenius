import 'package:drugenius/Firebase_Services/firebase_services.dart';
import 'package:drugenius/Paginas/loggin_page.dart';
import 'package:flutter/material.dart';
import 'package:drugenius/Componentes/my_textfield_general.dart';

final TextEditingController _emailController = TextEditingController();

Firebase_services fs = Firebase_services();

class RecoverPassword extends StatelessWidget {
  const RecoverPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    String email;
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
        //FONDO
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //LOGO
              children: [
                SizedBox(
                  width: 350.0,
                  child: Image.asset("assets/images/drugenius_logo.png"),
                ),
                //FIN LOGO
                const SizedBox(height: 50.0),
                //TXT RECUPERACIÓN
                const SizedBox(
                  child: Center(
                    child: Text(
                      "Recuperación de contraseña",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        //fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                ),
                //FIN TXT RECUPERACIÓN
                const SizedBox(height: 30.0),
                //TXT RECUPERACIÓN CORREO
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 25.0,
                  ),
                  child: const SizedBox(
                    child: Center(
                      child: Text(
                        "Ingrese su correo electrónico. Si el correo coincide con alguna cuenta se le enviará un enlace de recuperación.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          //fontFamily: 'Montserrat',
                          fontSize: 18.0,
                          color: Color(0xffbebcbc),
                        ),
                      ),
                    ),
                  ),
                ),
                //FIN TXT RECUPERACIÓN CORREO
                const SizedBox(height: 30.0),

                //TXT FIELD CORREO
                _myTextFieldCorreo(),
                //FIN TXT FIELD CORREO

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
                      onPressed: () async {
                        email = _emailController.text;
                        if (email.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content:
                                  Text('Debe ingresar un correo electrónico'),
                            ),
                          );
                        } else {
                          try {
                            // Llama a la función para solicitar el restablecimiento de la contraseña
                            await fs.resetPassword(email);
                            // Mostrar un SnackBar o un mensaje de éxito si lo deseas
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    'Se ha enviado un correo para restablecer la contraseña.'),
                              ),
                            );
                            // Luego, realiza la navegación a la página de inicio de sesión
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LogginPage(),
                              ),
                            );
                          } catch (e) {
                            // Maneja cualquier error que pueda ocurrir durante el proceso
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Ha ocurrido un error: $e'),
                              ),
                            );
                          }
                        }
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
                        "Envíar enlace",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          //fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
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
}
