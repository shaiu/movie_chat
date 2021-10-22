import 'package:firebase_auth/firebase_auth.dart';

import 'auth_state.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth;
  //final UserCreationService _userCreationService;

  AuthService(this._firebaseAuth);

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<AuthState> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return AuthState(AuthStatus.authed, "");
    } on FirebaseAuthException catch (e) {
      return AuthState(AuthStatus.error, e.message ?? "");
    }
  }

  Future<AuthState> signUp({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      //_userCreationService.createUser(email);
      return AuthState(AuthStatus.authed, "");
    } on FirebaseAuthException catch (e) {
      return AuthState(AuthStatus.error, e.message ?? "");
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
