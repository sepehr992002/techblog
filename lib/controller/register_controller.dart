import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tech_blog/components/api_constant.dart';
import 'package:tech_blog/services/dio_service.dart';
import 'package:tech_blog/view/screens/main_screen.dart';

import '../components/storage_const.dart';

class RegisterController extends GetxController {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController activationCodeTextEditingController = TextEditingController();
  var email = '';
  var userId = '';

  register() async {
    Map<String, dynamic> map = {'email': emailTextEditingController.text, 'command': 'register'};
    var response = await DioService().postMethod(map, ApiConstant.postRegister);
    email = emailTextEditingController.text;
    userId = response.data['user_id'];
    print(response);
  }

  verify() async {
    Map<String, dynamic> map = {
      'email': email,
      'user_id': userId,
      'code': activationCodeTextEditingController.text,
      'command': 'verify'
    };
    print(map);
    var response = await DioService().postMethod(map, ApiConstant.postRegister);
    print(response);
    var box = GetStorage();
    if (response.data['response'] == 'verified') {
      box.write(token, response.data['token']);
      box.write(userId, response.data['user_id']);
      print('read:::::' + box.read('token'));
      Get.to(MainScreen());
    }else{
      log('error');
    }
  }
}
