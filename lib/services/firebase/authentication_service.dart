import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationService{
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore=FirebaseFirestore.instance;
  final GoogleSignIn _googleSignIn=GoogleSignIn();

  AuthenticationService(this._firebaseAuth);
  Stream<User> get authStateChanges=> _firebaseAuth.authStateChanges();


  //Sign in with google
  Future<String> signInWithGoogle() async{
    final GoogleSignInAccount googleSignInAccount=await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication=await googleSignInAccount.authentication;
    final AuthCredential authCredential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    final UserCredential userCredential= await _firebaseAuth.signInWithCredential(authCredential);
    final User user=userCredential.user;
    assert(user.displayName!=null);
    assert(user.email!=null);

    final User currentUser=_firebaseAuth.currentUser;
    assert(currentUser.uid==user.uid);

    return "Error";
  }



  //Sign in email function
  Future<String> signIn({String email, String password}) async{
    try{
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      final AuthCredential authCredential = EmailAuthProvider.credential(email: email, password: password);
      final UserCredential userCredential= await _firebaseAuth.signInWithCredential(authCredential);
      final User user=userCredential.user;
      assert(user.displayName!=null);
      assert(user.email!=null);

      final User currentUser=_firebaseAuth.currentUser;
      assert(currentUser.uid==user.uid);
     return "Signed in";
    }on FirebaseAuthException catch(exception){
      print(exception.message);
    }
  }

  //Sign up email function
  Future<String> signUp({String fullname, String email, String password}) async{
    try{
      UserCredential userCredential= await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      await _firebaseAuth.currentUser.updateProfile(displayName: fullname);
      await _firestore.collection("Users").doc(userCredential.user.uid).set({
        'email':email,
        'fullname':fullname,
      });
      return 'Signed up';
    } on FirebaseAuthException catch(exception){
      print(exception.message);
    }catch (e) {
      print(e);
    }
  }

  //Get current user uid
  Future<String> getCurrentUserUID() async{
    return (await _firebaseAuth.currentUser).uid;
  }

  //Get current user
  Future getCurrentUser() async {
    return await _firebaseAuth.currentUser;
  }

  //Get current user name

  Future<void> resetPassword(String email) async{
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  // Sign Out
  Future <void> signOut() async{
    await _googleSignIn.signOut();
    await _firebaseAuth.signOut();
  }
}