import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_faultz/constant/consts.dart';
import 'package:e_faultz/constant/firebase_const.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class ProfileController extends GetxController {
  /// first get the image from gallery or camera so we need to user image_picket widget
  var profileImagePath = ''.obs;
  var nameController=TextEditingController();
  var passController=TextEditingController();
  var profileImageLink='';
  var isLoading=false.obs;

 Future changeImage(context) async {
    try {
      final img = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 70,
    );
    if(img==null)return;
    profileImagePath.value=img.path;
    }on PlatformException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }

  //upload profile photo to storage
  uploadProfileImage()async{
    var fileName= basename(profileImagePath.value);
    var destination='images/${user!.uid}/$fileName';
    Reference ref=FirebaseStorage.instance.ref().child(destination);
    await ref.putFile(File(profileImagePath.value));
    profileImageLink= await ref.getDownloadURL();
  }

  updateProfile({name,password,imageUrl})async{
    var store= firestore.collection(userCollection).doc(user!.uid);
   await store.set({
      'name':name,
      "password":password,
      'imageUrl':imageUrl,
    },SetOptions(merge: true));
    isLoading(false);
  }
}
