import 'package:movie_chat/models/user_model.dart' as UserModel;
import 'package:movie_chat/repo/user_repo.dart';

class UserCreationService {
  final UserRepo _userRepo;

  UserCreationService(this._userRepo);

  void createUser(String email) async {
    await _userRepo.saveUser(
      UserModel.User(
        email: email,
        username: _createUsername(email),
      ),
    );
  }

  //Username should be 7 characters or less
  String _createUsername(String email) {
    var username = email.split('@')[0];
    if (username.length <= 7) return username;
    return username.substring(0, 7);
  }
}
