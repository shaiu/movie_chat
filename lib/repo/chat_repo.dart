import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_chat/models/chat_message_model.dart';

class ChatRepo {
  final CollectionReference _ref =
      FirebaseFirestore.instance.collection('chat');

  void saveMessage(ChatMessage message) async {
    await _ref.add(message.toMap());
  }

  Stream<ChatMessage> getMessageUpdates(String movieChatId) async* {
    final snapshots =
        _ref.where('movie_chat_id', isEqualTo: movieChatId).snapshots();

    await for (final snapshot in snapshots) {
      for (final changes in snapshot.docChanges) {
        final Timestamp date = changes.doc['send_date'] as Timestamp;
        yield ChatMessage(
          id: changes.doc.id,
          date: date.toDate(),
          movieChatId: movieChatId,
          message: changes.doc['message'] as String,
          userName: changes.doc['user_name'] as String,
          userEmail: changes.doc['user_email'] as String,
        );
      }
    }
  }
}
