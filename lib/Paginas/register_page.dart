import 'package:flutter/material.dart';
import 'package:drugenius/Componentes/my_textfield_general.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
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

                SizedBox(height: 50.0),
                //TXT REGISTRO
                SizedBox(
                  child: Text(
                    "Registro",
                    style: TextStyle(
                        fontSize: 30,
                        //fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w800),
                  ),
                ),
                //FIN TXT REGISTRO
                SizedBox(height: 30.0),
                //TXT RELLENAR
                SizedBox(
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
                SizedBox(height: 30.0),

                //TXT FIELD NOMBRE
                _myTextFliedName(),
                //FIN TXT FIELD NOMBRE

                SizedBox(height: 15.0),

                //TXT FIELD CORREO
                _myTextFieldCorreo(),
                //FIN FIELD TXT CORREO

                SizedBox(height: 15.0),

                //TXT FIELD CONTRASEÑA
                _myTextFieldPassword(),
                //FIN TXT FIELD CONTRASEÑA
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
                        "Registrarse",
                        style: TextStyle(
                          //fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.black,
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

  _myTextFliedName() {
    return myTextFieldGeneral(
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
      icon: Icons.lock_outline_rounded,
      labelTxt: "Contraseña",
      obscureText: true,
      fontWeight: FontWeight.w700,
      onChanged: (value) {},
    );
  }
}
