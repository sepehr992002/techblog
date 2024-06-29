import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tech_blog/main.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tech_blog/my_colors.dart';
import 'gen/assets.gen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3)).then(
      (value) {
        Navigator.push(context, CupertinoPageRoute(
          builder: (context) {
            return MyHomePage();
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
            SpinKitThreeBounce(
              color: MyColors.primaryColor,
              size: 23,
            )
          ],
        ),
      ),
    );
  }
}
