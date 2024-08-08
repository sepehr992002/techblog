import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tech_blog/controller/register_controller.dart';
import 'package:tech_blog/view/article/article_list_screen.dart';
import '../../gen/assets.gen.dart';

class ManageArticles extends StatelessWidget {
  ManageArticles({super.key});
  // RegisterController registerController = Get.put(RegisterController());
  var registerController = Get.find<RegisterController>();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: appBar('مدیریت مقاله ها'),
      body: Center(
        child: articleEmptyState(context)
      ),
    );
  }
  Widget articleEmptyState(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          Assets.images.tcbot,
          height: 80,
          width: 80,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
            'هنوز هیچ مقاله ای به جامعخ گیگ های فارسی اضافه نکردی'),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
            onPressed: () {
            },
            child: Text(
              'بریم برای نوشتن یه مقاله باحال',
              style: Theme.of(context).textTheme.bodyMedium,
            )),
      ],
    );
  }
}
