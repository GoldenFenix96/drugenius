import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Firebase_services {
  FirebaseFirestore db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<DocumentSnapshot<Object?>> getUsuarioPorId(String userId) async {
    // Obtiene una referencia al documento de usuario específico
    DocumentReference documentReference = db.collection('Usuarios').doc(userId);

    // Realiza la consulta al documento
    DocumentSnapshot<Object?> documentSnapshot = await documentReference.get();

    // Devuelve el documento encontrado
    return documentSnapshot;
  }

  Future<User?> signUpAndCreateProfile(
      String email, String password, String nombre) async {
    try {
      // 1. Registrar al usuario en Firebase Authentication
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // 2. Obtener el ID del usuario registrado
      String userId = credential.user!.uid;

      // 3. Agregar la información adicional a Firestore
      await db.collection('Usuarios').doc(userId).set({
        'Nombre': nombre,
        'Correo': email,
        'Contraseña': password,
        // Puedes agregar otros campos aquí si es necesario
      });

      return credential.user;
    } catch (e) {
      print("Ha ocurrido un error en crear al usuario: $e");
      return null;
    }
  }
}
