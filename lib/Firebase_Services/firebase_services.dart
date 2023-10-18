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
    List<Map> cuadroBasico,
  ) async {
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
      });

      // 2. Almacenar los datos del cuadro básico en Firestore
      final cuadroBasicoCollection = db
          .collection('Medicamentos')
          .doc(documentReference.id)
          .collection('Cuadro Básico');

      for (int i = 0; i < cuadroBasico.length; i++) {
        await cuadroBasicoCollection.add({
          'name': cuadroBasico[i]['name'],
          'isChecked': cuadroBasico[i]['isChecked'],
        });
      }

      return documentReference.id;
    } catch (e) {
      print("Ha ocurrido un error al agregar el medicamento: $e");
      return null;
    }
  }

  //Agregar imagenes del medicamento
  Future<void> uploadImageToStorageAndFirestore(
      String documentId, File imageFile) async {
    try {
      // Subir la imagen a Firebase Storage
      final storageReference = FirebaseStorage.instance
          .ref()
          .child('$documentId/${DateTime.now()}.png');
      final uploadTask = storageReference.putFile(imageFile);
      final TaskSnapshot storageTaskSnapshot = await uploadTask;

      // Obtener la URL de la imagen en Firebase Storage
      final imageUrl = await storageTaskSnapshot.ref.getDownloadURL();

      // Almacenar la URL de la imagen en Firestore
      final cuadroBasicoCollection = FirebaseFirestore.instance
          .collection('Medicamentos')
          .doc(documentId)
          .collection('Imagenes'); // Cambia 'Imagenes' al nombre que desees
      await cuadroBasicoCollection.add({
        'imageUrl': imageUrl,
      });
    } catch (e) {
      print("Error al cargar la imagen: $e");
    }
  }

//Agregar imagenes de farmacocinetica del medicamento
  Future<void> subirFarmacocinetica(String documentId, File imageFile) async {
    try {
      // Subir la imagen a Firebase Storage
      final storageReference = FirebaseStorage.instance
          .ref()
          .child('$documentId/${DateTime.now()}.png');
      final uploadTask = storageReference.putFile(imageFile);
      final TaskSnapshot storageTaskSnapshot = await uploadTask;

      // Obtener la URL de la imagen en Firebase Storage
      final imageUrl = await storageTaskSnapshot.ref.getDownloadURL();

      // Almacenar la URL de la imagen en Firestore
      final cuadroBasicoCollection = FirebaseFirestore.instance
          .collection('Medicamentos')
          .doc(documentId)
          .collection(
              'Farmacocinetica'); // Cambia 'Imagenes' al nombre que desees
      await cuadroBasicoCollection.add({
        'imageUrl': imageUrl,
      });
    } catch (e) {
      print("Error al cargar la imagen: $e");
    }
  }
}
