import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:tech_blog/fake_data.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/my_colors.dart';
import 'package:tech_blog/view/profile_screen.dart';
import 'home_screen.dart';


class MainScreen extends StatefulWidget {

  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    double bodyMargin = width / 10;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.scaffoldBg,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.menu),
            Image.asset(
              Assets.images.logo.path,
              height: height / 13.6,
            ),
            Icon(Icons.search),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
        child: Stack(
          children: [
            IndexedStack(
              index: selectedIndex,
              children: [
                HomeScreen(bodyMargin: bodyMargin),
                ProfileScreen(),
              ],
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 12,
              child: BottomNav(bodyMargin: bodyMargin,onBottomNavigationTap: (chosenScreen) {
                setState(() {
                  selectedIndex = chosenScreen;
                });
              },)
            ),
          ],
        ),
      ),
    );
  }
}
class BottomNav extends StatelessWidget{
  final double bodyMargin;
  final Function(int chosenScreen) onBottomNavigationTap;
  const BottomNav({super.key,required this.bodyMargin,required this.onBottomNavigationTap});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: height / 10,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: GradientColors.bottomNavBackground,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      child: Padding(
        padding: EdgeInsets.only(left: bodyMargin, right: bodyMargin),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: () {
                    onBottomNavigationTap(0);
                  },
                  icon: Image.asset(
                    Assets.icons.home.path,
                    height: 30,
                    width: 30,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    Assets.icons.write.path,
                    height: 30,
                    width: 30,
                  )),
              IconButton(
                  onPressed: () {
                    onBottomNavigationTap(1);
                  },
                  icon: Image.asset(
                    Assets.icons.user.path,
                    height: 30,
                    width: 30,
                  )),
            ],
          ),
          height: height / 8,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              gradient:
              LinearGradient(colors: GradientColors.bottomNav)),
        ),
      ),
    );
  }
}