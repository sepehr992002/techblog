import 'package:flutter/material.dart';
import 'package:tech_blog/components/my_texts.dart';
import '../../gen/assets.gen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            Assets.images.profileAvatar.path,
            width: 80,
            height: 80,
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                Assets.icons.bluePen.path,
                width: 15,
                height: 15,
              ),
              const SizedBox(width: 4,),
              Text(
                MyTexts.editProfilePic,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            MyTexts.nameExample,
            style: TextStyle(color: Colors.black),
          ),
          const SizedBox(
            height: 9,
          ),
          Text(
            MyTexts.email,
            style: TextStyle(color: Colors.black),
          ),
          const SizedBox(
            height: 9,
          ),
          const Divider(
            indent: 32,
            endIndent: 32,
          ),
          const SizedBox(
            height: 9,
          ),
          Text(
            MyTexts.favoriteBlogs,
            style: TextStyle(color: Colors.black),
          ),
          const SizedBox(
            height: 9,
          ),
          const Divider(
            indent: 32,
            endIndent: 32,
          ),
          const SizedBox(
            height: 9,
          ),
          Text(
            MyTexts.favoritePodcasts,
            style: TextStyle(color: Colors.black),
          ),
          const SizedBox(
            height: 9,
          ),
          const Divider(
            indent: 32,
            endIndent: 32,
          ),
          const SizedBox(
            height: 9,
          ),
          Text(
            MyTexts.exitAccount,
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
