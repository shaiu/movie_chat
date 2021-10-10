class ChatMessage {
  final String? id; //will be null for new objects
  final DateTime date;
  final String movieChatId;
  final String userName;
  final String userEmail;
  final String message;

  const ChatMessage({
    this.id,
    required this.date,
    required this.movieChatId,
    required this.userName,
    required this.userEmail,
    required this.message,
  });

  Map<String, dynamic> toMap() {
    return {
      'send_date': date,
      'movie_chat_id': movieChatId,
      'message': message,
      'user_name': userName,
      'user_email': userEmail,
    };
  }
}
