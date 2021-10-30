import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/domain/user.dart';

class AuthService {
  final FirebaseAuth fAuth = FirebaseAuth.instance;

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await fAuth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return AppUser.fromFirebase(user!);
    } catch (e) {
    }
  }

  Future registerInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await fAuth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return AppUser.fromFirebase(user!);
    } catch (e) {
    }
  }

  Future logout() async{
    await fAuth.signOut();
  }


}