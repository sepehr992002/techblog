import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tech_blog/main.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tech_blog/components/my_colors.dart';
import 'package:tech_blog/view/main_screen.dart';

import '../gen/assets.gen.dart';

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
        Navigator.pushReplacement(context, CupertinoPageRoute(
          builder: (context) {
            return MainScreen();
          },
        ));
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
            SizedBox(height: 34,),
            SpinKitFadingCube(size: 23,color: MyColors.primaryColor,)
          ],
        ),
      ),
    );
  }
}
