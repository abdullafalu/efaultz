import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_faultz/constant/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../constant/firebase_const.dart';

class AuthController extends GetxController {

  var isLoading=false.obs;


  // login method
  Future<UserCredential?> loginMethod({
    context,
    required final String email,
    required final String password,
  }) async {
    UserCredential? userCredential;
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        userCredential=  await auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
      }
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  // sign up method
  Future<UserCredential?> signinMethod({
    context,
    required String name,
    required String email,
    required String password,
    required String reenterPassword,
  }) async {
    UserCredential? userCredential;
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          name.isNotEmpty ||
          reenterPassword.isNotEmpty) {
        await auth.createUserWithEmailAndPassword(
            email: email, password: password);
      }
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  // storing data to firestorage
  storeUserData({email,name,password}) async {
    DocumentReference store =
         firestore.collection(userCollection).doc(user!.uid);
    store.set({
      'name': name,
      'email': email,
      'password': password,
      'imageUrl':"",
      "id": user!.uid,
      "cart_count":"00",
      "wishlist_count":"00",
      "order_count":"00",

    });
  }

  // user signout method
  signoutMethod(context)async{
    try {
      await auth.signOut();
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }
}
