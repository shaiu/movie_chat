import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_chat/models/movie_chat_model.dart';

class MovieChatRepo {
  final CollectionReference _ref =
      FirebaseFirestore.instance.collection('movie_chat');

  Stream<List<MovieChat>> getMovieChats() async* {
    final snapshots = _ref.snapshots();

    await for (final snapshot in snapshots) {
      yield snapshot.docs
          .map(
            (doc) => MovieChat(
                id: doc.id,
                name: doc['name'] as String,
                description: doc['description'] as String,
                imagePath: doc['image_path'] as String),
          )
          .toList();
    }
  }
}
