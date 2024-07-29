import 'package:flutter/material.dart';
import '../../components/my_colors.dart';
import '../../gen/assets.gen.dart';

class BottomNav extends StatelessWidget {
  final double bodyMargin;
  final Function(int chosenScreen) onBottomNavigationTap;

  const BottomNav(
      {super.key,
        required this.bodyMargin,
        required this.onBottomNavigationTap});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height / 10,
      child: Padding(
        padding: EdgeInsets.only(left: bodyMargin, right: bodyMargin),
        child: Container(
          height: height / 8,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              gradient: const LinearGradient(colors: GradientColors.bottomNav)),
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
        ),
      ),
    );
  }
}
