import 'package:flutter/material.dart';
import '../../components/fake_data.dart';
import '../../components/my_colors.dart';
import '../../gen/assets.gen.dart';

class MainTags extends StatelessWidget {
  final int index;

  const MainTags({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(24),
          ),
          gradient:
          LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: GradientColors.tags)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
        child: Row(
          children: [
            Image.asset(
              Assets.icons.hashtagicon.path,
              color: Colors.white,
              width: 16,
              height: 16,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              tagList[index].title,
              style: Theme
                  .of(context)
                  .textTheme
                  .bodyMedium,
            )
          ],
        ),
      ),
    );
  }
}