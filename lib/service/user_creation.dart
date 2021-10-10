import 'package:movie_chat/models/user_model.dart' as user_model;
import 'package:movie_chat/repo/user_repo.dart';

class UserCreationService {
  final UserRepo _userRepo;

  UserCreationService(this._userRepo);

  Future<void> createUser(String email) async {
    await _userRepo.saveUser(
      user_model.User(
        email: email,
        username: _createUsername(email),
      ),
    );
  }

  //Username should be 7 characters or less
  String _createUsername(String email) {
    final username = email.split('@')[0];
    if (username.length <= 7) return username;
    return username.substring(0, 7);
  }
}
