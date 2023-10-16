import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drugenius/Clases/id_usuarios.dart';
import 'package:drugenius/Firebase_Services/firebase_services.dart';
import 'package:drugenius/Paginas/loggin_page.dart';
import 'package:drugenius/Paginas/nav_bar.dart';
import 'package:drugenius/main.dart';
import 'package:drugenius/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _Perfil();
}

TextEditingController _correoController = TextEditingController();
TextEditingController _nombreController = TextEditingController();
TextEditingController _contrasenaController = TextEditingController();
TextEditingController _contrasenaControllerActual = TextEditingController();

//String? userId = UserStateManager().userId;
String? userId = FirebaseAuth.instance.currentUser?.uid;

class _Perfil extends State<Perfil> {
  Firebase_services fs = Firebase_services();
  String nombre = '';
  String correo = '';
  String contrasena = '';
  String contrasenaActual = '';

  @override
  void initState() {
    super.initState();
    cargarDatosUsuario();
  }

  Future<void> cargarDatosUsuario() async {
    try {
      // Obtén el usuario actualmente autenticado

      // Verifica que userId no sea nulo antes de usarlo
      if (userId != null) {
        //userId = user.uid;
        DocumentSnapshot<Object?> usuarioSnapshot = await fs.getUsuarioPorId(
            userId!); // Agrega el operador '!' aquí para indicar que userId no es nulo
        if (usuarioSnapshot.exists) {
          final data = usuarioSnapshot.data() as Map<String, dynamic>?;

          if (data != null) {
            setState(() {
              nombre = data['Nombre'] ?? '';
              correo = data['Correo'] ?? '';
              contrasena = data['Contraseña'] ?? '';

              _nombreController.text = nombre;
              _correoController.text = correo;
              _contrasenaController.text = contrasena;
            });
          } else {
            print('El documento no contiene datos.');
          }
        } else {
          print('El usuario con ID $userId no existe.');
        }
        // Resto del código aquí...
      }
    } catch (e) {
      print('Error al cargar datos del usuario: $e');
    }
  }

  Future<void> _actualizarUsuario() async {
    String nombre = _nombreController.text;
    String correo = _correoController.text;
    String contrasena = _contrasenaController.text;

    print('Nombre: $nombre');
    print('Contraseña: $contrasena');
    print('Email: $correo');
    print('id: $userId');

    final currentContext = context;

    try {
      // Obtén el contexto antes de entrar al bloque try-catch

      //final User currentUser = FirebaseAuth.instance.currentUser.uid;

      // Llama a tu función de actualización desde AuthService
      final user = await fs.updateProfile(userId!, correo, contrasena, nombre);
      //print('id: $userId');
      if (user != null) {
        ScaffoldMessenger.of(currentContext).showSnackBar(
          const SnackBar(
            content: Text('Actualizacion exitosa del usuario.'),
          ),
        );
      } else {
        // Actualización fallida, muestra un mensaje de error
        ScaffoldMessenger.of(currentContext).showSnackBar(
          const SnackBar(
            content: Text('Ha ocurrido un error al actualizar el usuario.'),
          ),
        );
      }
    } catch (e) {
      final errorCode = e.hashCode;
      print('Error al actualizar usuario: $errorCode');
      // Maneja el error según tus necesidades
      if (e is FirebaseAuthException) {
        final errorCode = e.code;
        print('Error al actualizar usuario - Código de error: $errorCode');

        if (errorCode == 'requires-recent-login') {
          ScaffoldMessenger.of(currentContext).showSnackBar(
            const SnackBar(
              content: Text('Debe iniciar sesión de nuevo.'),
            ),
          );
          // Realiza acciones relacionadas con este error
        } else if (errorCode == 'otro-codigo-de-error') {
          // Otras acciones basadas en otros códigos de error
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 85, 145, 214),
          foregroundColor: const Color.fromARGB(255, 255, 255, 255),
          elevation: 0,
          title: Image.network(
            'https://i.ibb.co/0FZPjNw/Logo-Drugenius.png', // URL de la imagen en internet
            width: 300, // Ancho de la imagen
            height: 200, // Altura de la imagen
          ),
        ),
        drawer: const NavBar(),
        body: Container(
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
            child: ListView(
              children: [
                Center(
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 20.0, 0, 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              75), // Ajusta el radio según tu necesidad
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(
                                  255, 135, 201, 206), // Color de la sombra
                              blurRadius:
                                  10.0, // Radio de difuminado de la sombra
                              offset: Offset(0,
                                  2), // Desplazamiento de la sombra (eje x, eje y)
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                              75), // Ajusta el radio según tu necesidad
                          child: Image.network(
                            'https://i.ibb.co/JQ2sqXr/equipo-medico.png',
                            width: 150, // Ancho de la imagen
                            height: 150, // Alto de la imagen
                            fit: BoxFit
                                .cover, // Ajusta la forma en que la imagen se ajusta dentro del contenedor
                          ),
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      Container(
                        margin: const EdgeInsets.fromLTRB(40, 10.0, 40.0, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment
                              .start, // Cambia a MainAxisAlignment.start
                          crossAxisAlignment: CrossAxisAlignment
                              .start, // Alinea el contenido a la izquierda
                          children: [
                            const Text(
                              "  Nombre:",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            _textfieldNombre(),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Container(
                        margin: const EdgeInsets.fromLTRB(40, 10.0, 40.0, 0),
                        alignment: Alignment.centerLeft,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment
                              .start, // Cambia a MainAxisAlignment.start
                          crossAxisAlignment: CrossAxisAlignment
                              .start, // Alinea el contenido a la izquierda
                          children: [
                            const Text(
                              "  Correo Electrónico:",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            _textfieldCorreo(),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Container(
                        margin: const EdgeInsets.fromLTRB(40, 10.0, 40.0, 0),
                        alignment: Alignment.centerLeft,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment
                              .start, // Cambia a MainAxisAlignment.start
                          crossAxisAlignment: CrossAxisAlignment
                              .start, // Alinea el contenido a la izquierda
                          children: [
                            const Text(
                              "  Contraseña:",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            _textfieldPassword(),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Container(
                        margin: const EdgeInsets.fromLTRB(40, 10.0, 40.0, 0),
                        alignment: Alignment.centerLeft,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment
                              .start, // Cambia a MainAxisAlignment.start
                          crossAxisAlignment: CrossAxisAlignment
                              .start, // Alinea el contenido a la izquierda
                          children: [
                            const Text(
                              "Contraseña actual:",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            _textfieldPasswordActual()
                          ],
                        ),
                      ),
                      const SizedBox(height: 25.0),
                      Container(
                        margin: const EdgeInsets.fromLTRB(40, 10.0, 40.0, 0),
                        child: SizedBox(
                          width: size.width * 1,
                          height: 55.0,
                          child: ElevatedButton(
                              onPressed: () => {
                                    if (_contrasenaControllerActual
                                        .text.isEmpty)
                                      {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                                'Ingrese su contraseña actual para actualizar los datos'),
                                          ),
                                        )
                                      }
                                    else
                                      {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                AlertDialog(
                                                    title: const Text(
                                                        '¿Desea actaualizar sus datos?'),
                                                    content: const Text(
                                                        'Sus datos actuales se modificarán.'),
                                                    actions: <Widget>[
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                context,
                                                                'Cancel'),
                                                        child: const Text(
                                                            'Cancel'),
                                                      ),
                                                      TextButton(
                                                        onPressed: () => {
                                                          _singUp(context)
                                                              .whenComplete(
                                                                  () => {
                                                                        _actualizarUsuario(),
                                                                        Navigator.pop(
                                                                            context,
                                                                            'Aceptar'),
                                                                      })
                                                        },
                                                        child: const Text(
                                                            'Aceptar'),
                                                      ),
                                                    ]))
                                      }
                                  },
                              /*{
                                    _actualizarUsuario(),
                                  },*/
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                backgroundColor:
                                    const Color.fromRGBO(253, 200, 66, 1),
                                padding: const EdgeInsets.all(10),
                              ),
                              child: const Text(
                                "Actualizar Datos",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  //fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600,
                                ),
                              )),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        margin: const EdgeInsets.fromLTRB(40, 10.0, 40.0, 0),
                        child: SizedBox(
                          width: size.width * 1,
                          height: 55.0,
                          child: ElevatedButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                        title:
                                            const Text('¿Desea cerrar sesión?'),
                                        content:
                                            const Text('Su sesión se cerrará.'),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                context, 'Cancel'),
                                            child: const Text('Cancel'),
                                          ),
                                          TextButton(
                                            onPressed: () async => {
                                              signOut(context),

                                              /*
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const SplashScreen())),
                                              //Navigator.popUntil(context, ModalRoute.withName('/LogginPage')),
                                              */
                                            },
                                            child: const Text('Aceptar'),
                                          ),
                                        ],
                                      ));
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              backgroundColor:
                                  const Color.fromARGB(255, 253, 141, 66),
                              padding: const EdgeInsets.all(10),
                            ),
                            child: const Text(
                              "Cerrar sesión",
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
                      const SizedBox(height: 15.0),
                    ],
                  ),
                )
              ],
            )));
  }

  Future<bool> _singUp(BuildContext context) async {
    String email = FirebaseAuth.instance.currentUser!.email.toString();
    String pass = _contrasenaControllerActual.text;

    User? user = await fs.singInWithEmailAndPassword(email, pass);

    if (user != null) {
      //Navigator.pop(context);
      UserStateManager().userId = user.uid; // Guarda el ID del usuario
      print("Inicio de sesión exitoso");
      _contrasenaControllerActual.text =
          ''; //Limpia lo que hay en _contrasenaControllerActual
      return true;
    } else {
      print("Ocurrió un error");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('ERROR'),
        ),
      );
      return true;
    }
    //await new Future.delayed(const Duration(seconds: 1));
    //return true;
  }

  _textfieldNombre() {
    return Container(
      child: TextField(
        decoration: const InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              borderSide: BorderSide(
                color: Color.fromARGB(255, 204, 204, 204),
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0))),
          fillColor: Color.fromARGB(144, 255, 255, 255),
          filled: true,
          prefixIcon: Icon(Icons.person_outlined),
          labelStyle: TextStyle(
            color: Color.fromARGB(255, 33, 33, 33),
            fontWeight: FontWeight.bold,
          ),
        ),
        keyboardType: TextInputType.text,
        obscureText: false,
        controller:
            _nombreController, // Utiliza el controlador _nombreController
      ),
    );
  }

  _textfieldCorreo() {
    return Container(
      child: TextField(
        decoration: const InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              borderSide: BorderSide(
                color: Color.fromARGB(255, 204, 204, 204),
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0))),
          fillColor: Color.fromARGB(95, 255, 255, 255),
          filled: true,
          prefixIcon: Icon(Icons.email_outlined),
          labelStyle: TextStyle(
            color: Color.fromARGB(255, 33, 33, 33),
            fontWeight: FontWeight.bold,
          ),
        ),
        keyboardType: TextInputType.emailAddress,
        readOnly: true,
        //enabled: false,
        obscureText: false,
        controller: _correoController,
      ),
    );
  }

  _textfieldPassword() {
    return Container(
      child: TextField(
        decoration: const InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              borderSide: BorderSide(
                color: Color.fromARGB(255, 204, 204, 204),
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0))),
          fillColor: Color.fromARGB(144, 255, 255, 255),
          filled: true,
          prefixIcon: Icon(Icons.lock_outline_rounded),
          labelStyle: TextStyle(
            color: Color.fromARGB(255, 33, 33, 33),
            fontWeight: FontWeight.bold,
          ),
        ),
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        controller: _contrasenaController,
      ),
    );
  }

  _textfieldPasswordActual() {
    return Container(
      child: TextField(
        decoration: const InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              borderSide: BorderSide(
                color: Color.fromARGB(255, 204, 204, 204),
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0))),
          fillColor: Color.fromARGB(144, 255, 255, 255),
          filled: true,
          prefixIcon: Icon(Icons.lock_outline_rounded),
          labelStyle: TextStyle(
            color: Color.fromARGB(255, 33, 33, 33),
            fontWeight: FontWeight.bold,
          ),
        ),
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        controller: _contrasenaControllerActual,
      ),
    );
  }
}

void signOut(BuildContext context) async {
  try {
    await FirebaseAuth.instance.signOut();
    // El cierre de sesión se ha realizado con éxito
    // Puedes realizar acciones aquí
    Navigator.push(
      context,
      MaterialPageRoute(
        // Set the name here
        settings: RouteSettings(
          name: "/FisrtPage",
        ),
        builder: (context) => LogginPage(),
      ),
    );

    print("Cierre de sesión exitoso");
  } catch (e) {
    // Ocurrió un error al cerrar la sesión
    // Puedes manejar el error aquí
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Error al cerrar sesión'),
      ),
    );
    print("Error al cerrar sesión: $e");
  }
}
