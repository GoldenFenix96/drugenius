import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<DocumentSnapshot<Object?>> getUsuarioPorId(String userId) async {
  // Obtiene una referencia al documento de usuario específico
  DocumentReference documentReference = db.collection('Usuarios').doc(userId);

  // Realiza la consulta al documento
  DocumentSnapshot<Object?> documentSnapshot = await documentReference.get();

  // Devuelve el documento encontrado
  return documentSnapshot;
}

Future<void> agregarUsuario(
    String nombre, String correo, String contrasena) async {
  try {
    // Crea un nuevo documento en la colección 'Usuarios'
    await db.collection('Usuarios').add({
      'Nombre': nombre,
      'Correo': correo,
      'Contraseña': contrasena,
      // Puedes agregar otros campos aquí si es necesario
    });

    print('Usuario agregado con éxito a Firestore');
  } catch (e) {
    // Maneja los errores según tus necesidades
    print('Error al agregar usuario a Firestore: $e');
  }
}
