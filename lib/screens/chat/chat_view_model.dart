import 'package:movie_chat/models/chat_message_model.dart';
import 'package:movie_chat/repo/chat_repo.dart';
import 'package:movie_chat/repo/user_repo.dart';

class ChatViewModel {
  final ChatRepo _chatRepo;
  final UserRepo _userRepo;

  ChatViewModel(this._chatRepo, this._userRepo);

  List<ChatMessage> _messages = [];

  Stream<List<ChatMessage>> getChatMessages(String chatRoomId) {
    return _chatRepo
        .getMessageUpdates(chatRoomId)
        .map((update) => _handleUpdatedMessage(update));
  }

  List<ChatMessage> _handleUpdatedMessage(ChatMessage message) {
    final index = _messages.indexWhere((element) => element.id == message.id);
    if (index == -1) {
      //message is new, append to list
      _messages.add(message);
    } else {
      _messages[index] = message; //update existing message
    }

    _messages.sort((a, b) => b.date.compareTo(a.date));
    return _messages;
  }

  void saveMessage(String movieChatId, String message) async {
    final user = await _userRepo.getUser();
    _chatRepo.saveMessage(
      ChatMessage(
        movieChatId: movieChatId,
        date: DateTime.now(),
        message: message,
        userEmail: user.email,
        userName: user.username,
      ),
    );
  }
}
