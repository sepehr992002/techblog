import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../gen/assets.gen.dart';

class RegisterInto extends StatelessWidget {
  const RegisterInto({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(Assets.images.tcbot,height: 60,width: 60,),
          Text(
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black),
              'به تک بلاگ خوش اومدی برای ارسال مقاله و پادکست حتما باید ثبت نام کنی'),
          ElevatedButton(onPressed: () {}, child: Text("بزن بریم")),
        ],
      ),
    );
  }
}
