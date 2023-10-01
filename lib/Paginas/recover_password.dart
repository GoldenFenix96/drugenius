import 'package:flutter/material.dart';
import 'package:drugenius/Componentes/my_textfield_general.dart';

class RecoverPassword extends StatelessWidget {
  const RecoverPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Center(child: Text("")),
        backgroundColor: Color.fromARGB(0, 255, 255, 255),
        elevation: 0,
      ),
      body: Container(
        //FONDO
        decoration: BoxDecoration(
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
                SizedBox(height: 50.0),
                //TXT RECUPERACIÓN
                SizedBox(
                  child: Center(
                    child: Text(
                      "Recuperaciónde contraseña",
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
                SizedBox(height: 30.0),
                //TXT RECUPERACIÓN CORREO
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 25.0,
                  ),
                  child: SizedBox(
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
                SizedBox(height: 30.0),

                //TXT FIELD CORREO
                _myTextFieldCorreo(),
                //FIN TXT FIELD CORREO

                SizedBox(height: 30.0),
                //BOTÓN
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 25.0,
                  ),
                  child: SizedBox(
                    width: size.width * 1,
                    height: 50.0,
                    child: ElevatedButton(
                      onPressed: () => {},
                      child: const Text(
                        "Envíar enlace",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          //fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                10.0), // Cambia el radio de la esquina para personalizar la forma
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromRGBO(253, 200, 66, 1),
                        ),
                      ),
                    ),
                  ),
                ),
                //FIN BOTÓN
                SizedBox(height: 10.0),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _myTextFieldCorreo() {
    return myTextFieldGeneral(
      hintText: "ejemplo@test.com",
      icon: Icons.email_outlined,
      keyboardType: TextInputType.emailAddress,
      labelTxt: "Correo electrónico",
      fontWeight: FontWeight.w700,
      onChanged: (value) {},
    );
  }
}
