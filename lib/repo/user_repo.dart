import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_chat/models/user_model.dart' as user_model;

class UserRepo {
  final CollectionReference _ref =
      FirebaseFirestore.instance.collection('user');

  Future<DocumentReference> saveUser(user_model.User user) async {
    return _ref.add(user.toMap());
  }

  Future<user_model.User> getUser() async {
    final snapshot = await _ref
        .where('email', isEqualTo: FirebaseAuth.instance.currentUser?.email)
        .get();

    final doc = snapshot.docs[0];
    return user_model.User(
      id: doc.id,
      email: doc['email'] as String,
      username: doc['username'] as String,
    );
  }
}
