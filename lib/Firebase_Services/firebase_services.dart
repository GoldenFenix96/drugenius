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

  Future<void> updateMedication(
    String medicamentoId, // ID del medicamento que deseas actualizar
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
      // 1. Actualiza el medicamento en Firestore
      await db.collection('Medicamentos').doc(medicamentoId).update({
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

      // 2. Actualiza los datos del cuadro básico en Firestore
      final cuadroBasicoCollection = db
          .collection('Medicamentos')
          .doc(medicamentoId)
          .collection('Cuadro Básico');

      // 3. Borra los datos anteriores del cuadro básico
      final querySnapshot = await cuadroBasicoCollection.get();
      for (final doc in querySnapshot.docs) {
        await doc.reference.delete();
      }

      // 4. Almacena los nuevos datos del cuadro básico en Firestore
      for (int i = 0; i < cuadroBasico.length; i++) {
        await cuadroBasicoCollection.add({
          'name': cuadroBasico[i]['name'],
          'isChecked': cuadroBasico[i]['isChecked'],
        });
      }
    } catch (e) {
      print("Ha ocurrido un error al actualizar el medicamento: $e");
    }
  }

  Future<void> deleteMedication(String medicamentoId) async {
    try {
      // 1. Eliminar el medicamento de Firestore
      await db.collection('Medicamentos').doc(medicamentoId).delete();

      // 3. Eliminar la subcolección "Cuadro Básico" de Firestore
      await db
          .collection('Medicamentos')
          .doc(medicamentoId)
          .collection('Cuadro Básico')
          .get()
          .then((querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          doc.reference.delete();
        });
      });

      // 4. Eliminar la subcolección "Farmacocinetica" de Firestore
      await db
          .collection('Medicamentos')
          .doc(medicamentoId)
          .collection('Farmacocinetica')
          .get()
          .then((querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          doc.reference.delete();
        });
      });

      // 5. Eliminar la subcolección "Imagenes" de Firestore
      await db
          .collection('Medicamentos')
          .doc(medicamentoId)
          .collection('Imagenes')
          .get()
          .then((querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          doc.reference.delete();
        });
      });

      // 2. Eliminar las imágenes del medicamento de Storage
      final storageReference =
          FirebaseStorage.instance.ref().child(medicamentoId);
      await storageReference.delete();
    } catch (e) {
      print("Ha ocurrido un error al eliminar el medicamento: $e");
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

  // Actualizar imágenes del medicamento
  Future<void> updateMedicationImages(
    String documentId, // ID del medicamento a actualizar
    List<String> imagesToDelete, // Lista de URLs de imágenes a eliminar
  ) async {
    try {
      final medicamentoDocument = db.collection('Medicamentos').doc(documentId);

      // Eliminar imágenes de Firebase Storage y Firestore
      final imagenesCollection = medicamentoDocument.collection('Imagenes');
      for (final imageUrl in imagesToDelete) {
        // Eliminar la imagen de Firebase Storage
        final imageReference = FirebaseStorage.instance.refFromURL(imageUrl);
        await imageReference.delete();

        // Eliminar la imagen de Firestore
        final querySnapshot = await imagenesCollection
            .where('imageUrl', isEqualTo: imageUrl)
            .get();
        for (final doc in querySnapshot.docs) {
          await imagenesCollection.doc(doc.id).delete();
        }
      }
      print("Imagen borrada con exito");
    } catch (e) {
      print("Error al actualizar las imágenes del medicamento: $e");
    }
  }

// Actualizar imágenes de farmacocinetica
  Future<void> updateMedicationFarmacocinetica(
    String documentId, // ID del medicamento a actualizar
    List<String> imagesToDelete, // Lista de URLs de imágenes a eliminar
  ) async {
    try {
      final medicamentoDocument = db.collection('Medicamentos').doc(documentId);
      // Eliminar imágenes de Firebase Storage y Firestore
      final imagenesCollection =
          medicamentoDocument.collection('Farmacocinetica');
      for (final imageUrl in imagesToDelete) {
        // Eliminar la imagen de Firebase Storage
        final imageReference = FirebaseStorage.instance.refFromURL(imageUrl);
        await imageReference.delete();

        // Eliminar la imagen de Firestore
        final querySnapshot = await imagenesCollection
            .where('imageUrl', isEqualTo: imageUrl)
            .get();
        for (final doc in querySnapshot.docs) {
          await imagenesCollection.doc(doc.id).delete();
        }
      }
      print("Imagen de farmacocinetica borrada con exito");
    } catch (e) {
      print(
          "Error al actualizar las imágenes de la farmacocinética del medicamento: $e");
    }
  }

//Listar medicamentos
  Future<List<Map<String, dynamic>>?> getMedicamentos() async {
    try {
      final QuerySnapshot medicamentosQuery =
          await db.collection('Medicamentos').get();
      final medicamentos =
          await Future.wait(medicamentosQuery.docs.map((medicamentoDoc) async {
        final imagenSnapshot = await medicamentoDoc.reference
            .collection('Imagenes')
            .limit(1)
            .get();
        String imagenUrl = ''; // URL de la imagen
        if (imagenSnapshot.docs.isNotEmpty) {
          imagenUrl = imagenSnapshot.docs[0].get('imageUrl');
        }
        return {
          'id': medicamentoDoc.id,
          'nombre': medicamentoDoc['Nombre'],
          'grupo': medicamentoDoc['Grupo'],
          'subgrupo': medicamentoDoc['Subgrupo'],
          'imagenUrl': imagenUrl,
        };
      }));
      return medicamentos;
    } catch (e) {
      print('Error al obtener los medicamentos: $e');
      return null; // Manejo de errores
    }
  }

  //Traer datos del medicamento
  Future<Map<String, dynamic>?> obtenerMedicamento(String documentId) async {
    try {
      final medicamentoDoc =
          await db.collection('Medicamentos').doc(documentId).get();

      if (medicamentoDoc.exists) {
        final medicamentoData = medicamentoDoc.data() as Map<String, dynamic>;

        // Obtener datos de la subcolección "Cuadro Básico"
        final cuadroBasicoSnapshot =
            await medicamentoDoc.reference.collection('Cuadro Básico').get();
        final cuadroBasicoData = cuadroBasicoSnapshot.docs
            .map((cuadroDoc) => {
                  'isChecked': cuadroDoc['isChecked'],
                  'name': cuadroDoc['name'],
                })
            .toList();

        print(cuadroBasicoData);
        // Obtener datos de la subcolección "Imagenes"
        final imagenesSnapshot =
            await medicamentoDoc.reference.collection('Imagenes').get();
        final imagenUrls = imagenesSnapshot.docs
            .map((imagenDoc) => imagenDoc['imageUrl'] as String)
            .toList();

        // Obtener datos de la subcolección "Farmacocinetica"
        final farmacoSnapshot =
            await medicamentoDoc.reference.collection('Farmacocinetica').get();
        final farmacoUrls = farmacoSnapshot.docs
            .map((farmaDoc) => farmaDoc['imageUrl'] as String)
            .toList();

        return {
          'id': medicamentoDoc.id,
          'nombre': medicamentoData['Nombre'],
          'otroNombre': medicamentoData['Otro Nombre'],
          'contra': medicamentoData['Contraindicaciones'],
          'efectos': medicamentoData['Efectos'],
          'grupo': medicamentoData['Grupo'],
          'mecanismo': medicamentoData['Mecanismo de Acción'],
          'posologia': medicamentoData['Posología'],
          'presentacion': medicamentoData['Presentación'],
          'subgrupo': medicamentoData['Subgrupo'],
          'uso': medicamentoData['Uso Terapeutico'],
          'cuadroBasico': cuadroBasicoData,
          'imagenUrls': imagenUrls,
          'farmaUrls': farmacoUrls,
        };
      } else {
        return null; // Documento no encontrado
      }
    } catch (e) {
      print('Error al obtener el medicamento: $e');
      return null; // Manejo de errores
    }
  }

  //Agregar titulo de video
  Future<String?> addTVideo(
    String nombre,
  ) async {
    try {
      // 1. Agregar el Video a Firestore
      DocumentReference documentReference = await db.collection('Videos').add({
        'Nombre': nombre,
      });
      return documentReference.id;
    } catch (e) {
      print("Ha ocurrido un error al agregar el nombre del video: $e");
      return null;
    }
  }

  //Agregar Video
  Future<void> uploadVideoToStorageAndFirestore(
      String documentId, File videoFile) async {
    try {
      // Subir el video a Firebase Storage
      final storageReference = FirebaseStorage.instance
          .ref()
          .child('$documentId/${DateTime.now()}.mp4');
      final uploadTask = storageReference.putFile(videoFile);
      final TaskSnapshot storageTaskSnapshot = await uploadTask;

      // Obtener la URL deL video en Firebase Storage
      final videoUrl = await storageTaskSnapshot.ref.getDownloadURL();

      // Almacenar la URL del video en Firestore
      final videoCollection = FirebaseFirestore.instance
          .collection('Videos')
          .doc(documentId)
          .collection('Video');
      await videoCollection.add({
        'videoUrl': videoUrl,
      });
    } catch (e) {
      print("Error al cargar el video: $e");
    }
  }

  //Agregar titulo del podcast
  Future<String?> addTAudio(
    String nombre,
    String creador,
  ) async {
    try {
      // 1. Agregar el Video a Firestore
      DocumentReference documentReference = await db.collection('Audios').add({
        'Nombre': nombre,
        'Creador': creador,
      });
      return documentReference.id;
    } catch (e) {
      print("Ha ocurrido un error al agregar el nombre del audio: $e");
      return null;
    }
  }

  //Agregar podcast
  Future<void> uploadAudioToStorageAndFirestore(
      String documentId, File audioFile) async {
    try {
      // Subir el audio a Firebase Storage
      final storageReference = FirebaseStorage.instance
          .ref()
          .child('$documentId/${DateTime.now()}.mp3');
      final uploadTask = storageReference.putFile(audioFile);
      final TaskSnapshot storageTaskSnapshot = await uploadTask;

      // Obtener la URL deL audio en Firebase Storage
      final audioUrl = await storageTaskSnapshot.ref.getDownloadURL();

      // Almacenar la URL del audio en Firestore
      final cuadroBasicoCollection = FirebaseFirestore.instance
          .collection('Audios')
          .doc(documentId)
          .collection('Audio');
      await cuadroBasicoCollection.add({
        'audioUrl': audioUrl,
      });
    } catch (e) {
      print("Error al cargar el audio: $e");
    }
  }

  //Listar videos
  Future<List<Map<String, dynamic>>?> getVideos() async {
    try {
      final QuerySnapshot videosQuery = await db.collection('Videos').get();
      final videos = await Future.wait(videosQuery.docs.map((videoDoc) async {
        final nombre = videoDoc['Nombre'];
        final videoUrls = <String>[];

        final videoUrlsQuery = await db
            .collection('Videos')
            .doc(videoDoc.id)
            .collection('Video')
            .get();

        for (final videoUrlDoc in videoUrlsQuery.docs) {
          final url = videoUrlDoc['videoUrl'];
          videoUrls.add(url);
        }

        return {
          'id': videoDoc.id,
          'nombre': nombre,
          'videoUrls': videoUrls,
        };
      }));
      return videos;
    } catch (e) {
      print('Error al obtener los videos: $e');
      return null; // Manejo de errores
    }
  }

  //Agregar Grupo
  Future<String?> addGrupo(
    String grupo,
  ) async {
    try {
      // 1. Agregar el medicamento a Firestore
      DocumentReference documentReference = await db.collection('Grupo').add({
        'Nombre': grupo,
      });

      return documentReference.id;
    } catch (e) {
      print("Ha ocurrido un error al agregar el grupo: $e");
      return null;
    }
  }

  Future<List<String>?> getGrupos() async {
    try {
      // Realiza una consulta para obtener todos los documentos de la colección 'Grupo'
      QuerySnapshot gruposQuery = await db.collection('Grupo').get();

      // Convierte los documentos en una lista de Map
      List<String> grupos = gruposQuery.docs.map((grupoDoc) {
        return grupoDoc['Nombre'] as String;
      }).toList();

      return grupos;
    } catch (e) {
      print('Error al obtener los grupos: $e');
      return null; // Manejo de errores
    }
  }

  //Agregar Subgrupo
  Future<String?> addSubgrupo(
    String subgrupo,
  ) async {
    try {
      // 1. Agregar el medicamento a Firestore
      DocumentReference documentReference =
          await db.collection('Subgrupo').add({
        'Nombre': subgrupo,
      });

      return documentReference.id;
    } catch (e) {
      print("Ha ocurrido un error al agregar el subgrupo: $e");
      return null;
    }
  }

  Future<List<String>?> getSubgrupos() async {
    try {
      // Realiza una consulta para obtener todos los documentos de la colección 'Grupo'
      QuerySnapshot gruposQuery = await db.collection('Subgrupo').get();

      // Convierte los documentos en una lista de Map
      List<String> subgrupos = gruposQuery.docs.map((grupoDoc) {
        return grupoDoc['Nombre'] as String;
      }).toList();

      return subgrupos;
    } catch (e) {
      print('Error al obtener los subgrupos: $e');
      return null; // Manejo de errores
    }
  }
}
