import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/domain/user.dart';

class AuthService {
  FirebaseAuth fAuth = FirebaseAuth.instance;

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return AppUser.fromFirebase(user!);
    } catch (e) {
      print(e);
      return e;
    }
  }

  Future registerInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return AppUser.fromFirebase(user!);
    } catch (e) {
      print(e);
      return e;
    }
  }

  Future logout() async {
    await FirebaseAuth.instance.signOut();
  }

  Stream<AppUser?> get currentUser {
    return FirebaseAuth.instance
        .authStateChanges()
        .map((User? user) => user != null ? AppUser.fromFirebase(user) : null);

    // FirebaseAuth.instance.authStateChanges().listen((User? user) {
    //   if (user == null) {
    //   } else {
    //     return User.fromFirebase(user);
    //   }
    // });
  }
}
