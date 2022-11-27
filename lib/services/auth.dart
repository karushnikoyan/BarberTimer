// import 'package:firebase_auth/firebase_auth.dart';
//
// class AuthService {
//   final FirebaseAuth _fAuth =FirebaseAuth.instance;
//
//   User? get currentUser => _fAuth.currentUser;
//
//   Stream<User?> get authStateChanges => _fAuth.authStateChanges();
//
//   Future signInWithEmailAndPassword ({required String email, required String password}) async{
//     try{
//       UserCredential result = await _fAuth.signInWithEmailAndPassword(email: email, password: password);
//       // User? user = result.user;
//
//     }catch(e){
// return null;
//     };
//   }
//
//   Future createWithEmailAndPassword ({required String email, required String password}) async{
//     try{
//       UserCredential result = await _fAuth.createUserWithEmailAndPassword(email: email, password: password);
//       // User? user = result.user;
//
//     }catch(e){
//       return null;
//     };
//   }
//   Future signOut () async{
//     await _fAuth.signOut();
//   }
//
// }

