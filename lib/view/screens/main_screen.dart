import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_blog/components/api_constant.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/components/my_colors.dart';
import 'package:tech_blog/services/dio_service.dart';
import 'package:tech_blog/view/screens/profile_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/bottom_navigation.dart';
import '../widgets/my_drawer.dart';
import 'home_screen.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class MainScreen extends StatelessWidget {
  final Rx<int> selectedIndex = 0.obs;

  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DioService().getMethod(ApiConstant.getHomeItems);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    double bodyMargin = width / 10;
    return Scaffold(
      key: _scaffoldKey,
      drawer: MyDrawer(bodyMargin: bodyMargin),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: MyColors.scaffoldBg,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
                onTap: () {
                  _scaffoldKey.currentState!.openDrawer();
                },
                child: const Icon(Icons.menu)),
            Image.asset(
              Assets.images.logo.path,
              height: height / 13.6,
            ),
            const Icon(Icons.search),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
        child: Stack(
          children: [
            Obx(
              () => IndexedStack(
                index: selectedIndex.value,
                children: [
                  HomeScreen(bodyMargin: bodyMargin),
                  const ProfileScreen(),
                ],
              ),
            ),
            Positioned(
                left: 0,
                right: 0,
                bottom: 12,
                child: BottomNav(
                  bodyMargin: bodyMargin,
                  onBottomNavigationTap: (chosenScreen) {
                    selectedIndex.value = chosenScreen;
                  },
                )),
          ],
        ),
      ),
    );
  }
}

urlLauncher(String url) async {
  var uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    log("Could not launch url : ${url.toString()}");
  }
}
