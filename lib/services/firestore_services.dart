import 'package:e_faultz/constant/firebase_const.dart';

class FirestoreServices{

  // get the datas from firebase
  static getUser(uid){
   return firestore.collection(userCollection).where("id", isEqualTo: uid).snapshots();
  }
}