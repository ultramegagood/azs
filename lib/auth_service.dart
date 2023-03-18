import 'package:firebase_auth/firebase_auth.dart';


class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<User?> get userStream => _auth.authStateChanges();
  static bool? _isLoggedIn;

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
  static bool isLoggedIn() {
    if(_isLoggedIn == null) {
      FirebaseAuth.instance
          .authStateChanges()
          .listen((User? user) {
        _isLoggedIn = user?.uid != null;
      });
      _isLoggedIn = _firebaseAuth.currentUser?.uid != null;
      return _isLoggedIn ?? false;
    }
    else {
      return _isLoggedIn ?? false;
    }}

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
