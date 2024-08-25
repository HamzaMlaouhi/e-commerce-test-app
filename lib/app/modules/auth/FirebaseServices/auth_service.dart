import 'dart:developer';

import 'package:ecommerce_app/app/components/custom_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;

  Future<User?> createUserWithEmailAndPasswords(
      String email, String password) async {
    try {
      print("hamzaaaaaaaaaaaaa");
      final cred = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      print("${cred.user}");

      return cred.user;
    } catch (e) {
      CustomSnackBar.showCustomSnackBar(
          title: 'Erreur',
          message: 'please correct your credentials',
          snackcolor:  Colors.red);
    }
    return null;
  }

  Future<User?> loginUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final cred = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return cred.user;
    } catch (e) {
      CustomSnackBar.showCustomSnackBar(
          title: 'Erreur',
          message: 'please correct your credentials',
          snackcolor:  Colors.red);
    }
    return null;
  }

  Future<void> signout({required BuildContext context}) async {
    try {
      await _auth.signOut();
    } catch (e) {
      log("Something went wrong");
    }
  }
}
