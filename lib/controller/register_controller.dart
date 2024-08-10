import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tech_blog/components/api_constant.dart';
import 'package:tech_blog/main.dart';
import 'package:tech_blog/services/dio_service.dart';
import 'package:tech_blog/view/article/manage_articles.dart';
import 'package:tech_blog/view/register/register_into_screen.dart';
import 'package:tech_blog/view/screens/main_screen.dart';
import '../components/storage_const.dart';
import '../gen/assets.gen.dart';

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
    // debugPrint(response.data.toString());
  }

  verify() async {
    Map<String, dynamic> map = {
      'email': email,
      'user_id': userId,
      'code': activationCodeTextEditingController.text,
      'command': 'verify'
    };
    // debugPrint(map.toString());
    var response = await DioService().postMethod(map, ApiConstant.postRegister);
    // debugPrint(response.data.toString());
    var box = GetStorage();
    var status = response.data['response'];
    switch (status) {
      case 'verified':
        box.write(StorageKey.token, response.data['token']);
        box.write(StorageKey.userId, response.data['user_id']);
        // debugPrint("read::::: ${box.read('token')}");
        Get.offAll(MainScreen());
      // of all method removes all pages in the stack that are open
      case 'incorrect_code':
        Get.snackbar("error", "کد فعال سازی اشتباه است");
        break;
      case 'expired':
        Get.snackbar("error", "کد فعال سازی منقضی شده است");
        break;
    }
  }

  toggleToken() {
    if (GetStorage().read(StorageKey.token) == null) {
      // Get.to(RegisterIntoScreen());
      routeToWriteBottomSheet();
    } else {
      routeToWriteBottomSheet();
    }
  }

  routeToWriteBottomSheet() {
    Get.bottomSheet(Container(
      height: Get.height / 3,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  Assets.images.tcbot,
                  height: 40,
                ),
                SizedBox(
                  height: 8,
                ),
                Text('دونسته هات رو با بقیه به اشتراک بذار',style: TextStyle(color: Colors.black),),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Text("""
فکر کن اینجا بودنت به این معناست که یک گیگ تکنولوژی هستی
دونسته هات رو با جامعه گیگ های فارسی به اشتراک بذار
            """,style: TextStyle(color: Colors.black),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    Get.toNamed(NamedRoute.routeManageArticles);
                    // debugPrint('write article');
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        Image.asset(
                          Assets.icons.writeArticleIcon.path,
                          height: 32,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text('مدیریت مقاله ها',style: TextStyle(color: Colors.black),),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // debugPrint('write podcasts');
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        Image.asset(
                          Assets.icons.writePodcastIcon.path,
                          height: 32,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text('مدیریت پادکست ها',style: TextStyle(color: Colors.black),),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
