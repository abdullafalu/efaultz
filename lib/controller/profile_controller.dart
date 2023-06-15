import 'package:e_faultz/constant/consts.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  /// first get the image from gallery or camera so we need to user image_picket widget
  var profileImagePath = ''.obs;

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
}
