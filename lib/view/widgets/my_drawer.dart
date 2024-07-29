import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '../../components/my_colors.dart';
import '../../components/my_texts.dart';
import '../../gen/assets.gen.dart';
import '../screens/main_screen.dart';

class MyDrawer extends StatelessWidget {
  final double bodyMargin;

  const MyDrawer({super.key, required this.bodyMargin});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Drawer(
      width: width / 1.3,
      backgroundColor: MyColors.scaffoldBg,
      child: Padding(
        padding: EdgeInsets.only(left: bodyMargin, right: bodyMargin),
        child: ListView(
          children: [
            DrawerHeader(
                child: Center(
                  child: Image.asset(
                    Assets.images.logo.path,
                    scale: 3,
                  ),
                )),
            ListTile(
              title: Text(
                MyTexts.profile,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              onTap: () {},
            ),
            const Divider(
              color: MyColors.dividerColor,
            ),
            ListTile(
              title: Text(MyTexts.aboutTechBlog, style: Theme.of(context).textTheme.titleMedium),
              onTap: () {},
            ),
            const Divider(
              color: MyColors.dividerColor,
            ),
            ListTile(
              title: Text(MyTexts.share, style: Theme.of(context).textTheme.titleMedium),
              onTap: () async {
                await Share.share(MyTexts.shareText);
              },
            ),
            const Divider(
              color: MyColors.dividerColor,
            ),
            ListTile(
              title: Text(MyTexts.techBlogInGithub, style: Theme.of(context).textTheme.titleMedium),
              onTap: () {
                urlLauncher(MyTexts.techBlogGithubUrl);
              },
            ),
            const Divider(
              color: MyColors.dividerColor,
            )
          ],
        ),
      ),
    );
  }
}
