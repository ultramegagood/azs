/// Класс репозитория методов для аутентификаций

import 'package:firebase_auth/firebase_auth.dart';

///
/// Класс репозитория методов для аутентификаций
///
///
class AuthService {
  ///
  /// Обьект для того чтобы получить состояние с Firebase базы с телефона
  ///
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User?> get userStream => _auth.authStateChanges();
  static bool? _isLoggedIn;

  ///
  /// Авторация с почтой и паролем
  ///
  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      final UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  ///
  /// регистрация с почтой и паролем
  ///
  Future<User?> registerWithEmailAndPassword(String email, String password) async {
    try {
      final UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } catch (e) {
      print(e);
      return null;
    }
  }


  Future<void> signOut() async {
    await _auth.signOut();
  }
}
