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

  Future<User?> singInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      // ignore: avoid_print
      print("Ha ocurrido un error");
    }
    return null;
  }

  Future<User?> updateProfile(
      String userId, String email, String password, String nombre) async {
    try {
      // 1. Actualiza el perfil en Firebase Authentication
      await _auth.currentUser!.updateEmail(email);
      await _auth.currentUser!.updatePassword(password);

      // 2. Actualiza la información adicional en Firestore
      await db.collection('Usuarios').doc(userId).update({
        'Nombre': nombre,
        'Correo': email,
        'Contraseña': password,
      });

      return _auth.currentUser;
    } catch (e) {
      print("Ha ocurrido un error al actualizar el perfil: $e");
      return null;
    }
  }

  Future<void> deleteUsuario(String userId) async {
    try {
      // 1. Elimina al usuario de Firebase Authentication
      await _auth.currentUser!.delete();

      // 2. Elimina la información del usuario en Firestore
      await db.collection('Usuarios').doc(userId).delete();
    } catch (e) {
      print("Ha ocurrido un error al dar de baja al usuario: $e");
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      // Éxito: se envió un enlace de restablecimiento de contraseña al correo electrónico del usuario.
    } catch (e) {
      // Error: no se pudo enviar el enlace de restablecimiento de contraseña.
      print("Error al enviar el enlace de restablecimiento de contraseña: $e");
    }
  }
}
