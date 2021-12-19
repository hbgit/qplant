// This code is based on
// https://github.com/jerimkaura/flutter-book/blob/main/social_auth/lib/Services/authservice.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class AuthService {
  late var _resultAuth;

  _setAuthFromMultipleProviders(
      AuthCredential? credential, List<String> emailList) async {
    if (emailList.first == "google.com") {
      //await _auth.signIn
      print(emailList.first);
      print(credential);
      //this.service.signInwithGoogle(true, credential);
    }
  }

  //fb signIn
  fbSignIn() async {
    try {
      final fb = FacebookLogin();
      // Log in
      final res = await fb.logIn(permissions: [
        FacebookPermission.publicProfile,
        FacebookPermission.email,
      ]);

      // Check result status
      switch (res.status) {
        case FacebookLoginStatus.success:
          // Logged in
          // Send access token to server for validation and auth
          final FacebookAccessToken? accessToken = res.accessToken;
          final AuthCredential authCredential =
              FacebookAuthProvider.credential(accessToken!.token);
          final result = await _auth.signInWithCredential(authCredential);
          _resultAuth = result;
          print(_resultAuth);

          // Get profile data
          final profile = await fb.getUserProfile();
          print('Hello, ${profile!.name}! You ID: ${profile.userId}');

          // Get user profile image url
          final imageUrl = await fb.getProfileImageUrl(width: 100);
          print('Your profile image: $imageUrl');

          // Get email (since we request email permission)
          final email = await fb.getUserEmail();
          // But user can decline permission
          if (email != null) print('And your email is $email');

          break;

        case FacebookLoginStatus.cancel:
          // User cancel log in
          break;

        case FacebookLoginStatus.error:
          // Log in failed
          print('Error while log in: ${res.error}');
          break;
      }
    } catch (e) {
      if (e is FirebaseAuthException) {
        print(">>>>>>>>>>> FACEBOOK");
        if (e.code == 'account-exists-with-different-credential') {
          List<String> emailList =
              await FirebaseAuth.instance.fetchSignInMethodsForEmail(e.email!);
          print(emailList.first);
          _setAuthFromMultipleProviders(e.credential, emailList);
        }
      }
    }
  }

  signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser =
          await GoogleSignIn(scopes: <String>["email"]).signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      // Once signed in, return the UserCredential
      return await _auth.signInWithCredential(credential);
    } catch (e) {
      // SOLUTION from: https://petercoding.com/firebase/2021/06/06/using-twitter-authentication-with-firebase-in-flutter/#link-multiple-auth-providers
      if (e is FirebaseAuthException) {
        print(">>>>>>>>>>> GOOGLE");
        if (e.code == 'account-exists-with-different-credential') {
          List<String> emailList =
              await FirebaseAuth.instance.fetchSignInMethodsForEmail(e.email!);
          print(emailList.first);
          _setAuthFromMultipleProviders(e.credential, emailList);
        }
      }
    }
  }

  //Sign out
  signOut() async {
    await FirebaseFirestore.instance.clearPersistence();
    await _auth.signOut();
  }
}
