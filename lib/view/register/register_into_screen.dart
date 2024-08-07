import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tech_blog/controller/register_controller.dart';
import 'package:tech_blog/view/screens/cats_screen.dart';
import 'package:validators/validators.dart';
import '../../gen/assets.gen.dart';
import '../../components/my_texts.dart';

class RegisterIntoScreen extends StatelessWidget {
  RegisterIntoScreen({super.key});
  RegisterController registerController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
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
              MyTexts.welcomeMessage),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                _showEmailBottomSheet(context, height);
              },
              child: Text(
                MyTexts.letsGo,
                style: Theme.of(context).textTheme.bodyMedium,
              )),
        ],
      ),
    );
  }

  Future<dynamic> _showEmailBottomSheet(BuildContext context, double height) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: height / 2,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16), topLeft: Radius.circular(16))),
          child: Column(
            children: [
              const SizedBox(
                height: 12,
              ),
              Text(
                MyTexts.enterYourEmail,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Padding(
                padding: const EdgeInsets.all(24),
                child: TextField(
                  controller: registerController.emailTextEditingController,
                  onChanged: (value) {
                    if (isEmail(value)) {
                      log('email is correct');
                    } else {
                      // validator package which includes is email is used to validate strings
                      log("email is false");
                    }
                  },
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: MyTexts.hintEmail,
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    registerController.register();
                    Navigator.pop(context);
                    _activateCodeBottomSheet(context, height);
                  },
                  child: Text(
                    MyTexts.continew,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ))
            ],
          ),
        );
      },
    );
  }

  Future<dynamic> _activateCodeBottomSheet(
      BuildContext context, double height) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: height / 2,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16), topLeft: Radius.circular(16))),
          child: Column(
            children: [
              const SizedBox(
                height: 12,
              ),
              Text(
                MyTexts.enterActivationCode,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Padding(
                padding: const EdgeInsets.all(24),
                child: TextField(
                  controller: registerController.activationCodeTextEditingController,
                  onChanged: (value) {
                    if (isEmail(value)) {
                      log('activation code is correct');
                    } else {
                      // validator package which includes is email is used to validate strings
                      log("activation code is false");
                    }
                  },
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "*********",
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    registerController.verify();
                    // Navigator.pushReplacement(context, MaterialPageRoute(
                    //   builder: (context) {
                    //     return MyCats();
                    //   },
                    // ));
                  },
                  child: Text(
                    MyTexts.continew,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ))
            ],
          ),
        );
      },
    );
  }
}
