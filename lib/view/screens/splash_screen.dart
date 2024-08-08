import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:tech_blog/components/my_colors.dart';
import 'package:tech_blog/main.dart';

import '../../gen/assets.gen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1)).then(
      (value) {
        Get.offAndToNamed(NamedRoute.routeMainScreen);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              Assets.images.logo.path,
              height: 64,
            ),
            const SizedBox(
              height: 34,
            ),
            const SpinKitFadingCube(
              size: 23,
              color: MyColors.primaryColor,
            )
          ],
        ),
      ),
    );
  }
}
