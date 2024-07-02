import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tech_blog/components/my_texts.dart';
import '../components/fake_data.dart';
import '../gen/assets.gen.dart';
import '../components/my_colors.dart';

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
              Text(MyTexts.editProfilePic,style: TextStyle(color: Colors.blue),),
            ],
          ),
          Text(MyTexts.nameExample,style: TextStyle(color: Colors.black),),
          Text(MyTexts.email,style: TextStyle(color: Colors.black),),
          Divider(indent: 32,endIndent: 32,),
          Text(MyTexts.favoriteBlogs,style: TextStyle(color: Colors.black),),
          Divider(indent: 32,endIndent: 32,),
          Text(MyTexts.favoritePodcasts,style: TextStyle(color: Colors.black),),
          Divider(indent: 32,endIndent: 32,),
          Text(MyTexts.exitAccount,style: TextStyle(color: Colors.black),),
        ],
      ),
    );
  }
}
