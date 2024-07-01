import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../fake_data.dart';
import '../gen/assets.gen.dart';
import '../my_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            Assets.images.profileAvatar.path,
            width: 60,
            height: 60,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                Assets.icons.bluePen.path,
                width: 20,
                height: 20,
              ),
              Text("ویرایش عکس پروفایل",style: TextStyle(color: Colors.blue),),
            ],
          ),
          Text("فاطمه امیری",style: TextStyle(color: Colors.black),),
          Text('fatemeamiri@gmail.com',style: TextStyle(color: Colors.black),),
          Divider(indent: 32,endIndent: 32,),
          Text('my favorite blogs',style: TextStyle(color: Colors.black),),
          Divider(indent: 32,endIndent: 32,),
          Text('my favorite podcasts',style: TextStyle(color: Colors.black),),
          Divider(indent: 32,endIndent: 32,),
          Text('exit account',style: TextStyle(color: Colors.black),),
        ],
      ),
    );
  }
}
