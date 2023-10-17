import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Firebase_services {
  FirebaseFirestore db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final storage = FirebaseStorage.instance;

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

  //Medicamentos

  //Agregar medicamentos
  Future<String?> addMedication(
      String nombre,
      String grupo,
      String subgrupo,
      String otroNombre,
      String presentacion,
      String mecanismoAccion,
      String usoTerapeutico,
      String efectos,
      String contraindicaciones,
      String posologia,
      String cuadroBasico,
      List<String> images,
      List<String> farmacocinetica) async {
    try {
      // 1. Agregar el medicamento a Firestore
      DocumentReference documentReference =
          await db.collection('Medicamentos').add({
        'Nombre': nombre,
        'Grupo': grupo,
        'Subgrupo': subgrupo,
        'Otro Nombre': otroNombre,
        'Presentación': presentacion,
        'Mecanismo de Acción': mecanismoAccion,
        'Uso Terapeutico': usoTerapeutico,
        'Efectos': efectos,
        'Contraindicaciones': contraindicaciones,
        'Posología': posologia,
        'Cuadro Básico': cuadroBasico,
      });

      // 2. Almacenar las imágenes en Storage
      for (int i = 0; i < images.length; i++) {
        await uploadImageToStorage(documentReference.id, images[i] as File);
      }

      // 3. Almacenar las imágenes de farmacocinetica en Storage
      for (int i = 0; i < farmacocinetica.length; i++) {
        await uploadImageToStorage(
            documentReference.id, farmacocinetica[i] as File);
      }

      return documentReference.id;
    } catch (e) {
      print("Ha ocurrido un error al agregar el medicamento: $e");
      return null;
    }
  }

  //Agregar imagenes del medicamento
  Future<void> uploadImageToStorage(String medicationId, File imageFile) async {
    try {
      final storage = FirebaseStorage.instance;
      final storageReference = storage.ref().child(
          'medications/$medicationId/${DateTime.now().millisecondsSinceEpoch}.jpg');
      await storageReference.putFile(imageFile);

      final imageUrl = await storageReference.getDownloadURL();

      print('Imagen cargada y URL de descarga: $imageUrl');
    } catch (e) {
      print("Ha ocurrido un error al cargar la imagen: $e");
    }
  }
}
