import 'package:flutter/material.dart';
import '../../components/my_colors.dart';

class HomeScreenPoster extends StatelessWidget {
  final int view;
  final String imagePath;
  final String author;
  final String date;
  final String title;

  const HomeScreenPoster({super.key,
    required this.view,
    required this.author,
    required this.date,
    required this.imagePath,
    required this.title});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery
        .of(context)
        .size
        .width;
    var height = MediaQuery
        .of(context)
        .size
        .height;
    return Stack(
      children: [
        Container(
          width: width / 1.25,
          height: height / 4.2,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(fit: BoxFit.cover, image: AssetImage(imagePath))),
        ),
        Container(
          width: width / 1.25,
          height: height / 4.2,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: GradientColors.homePosterCoverGradient)),
        ),
        Positioned(
            bottom: 8,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.fromLTRB(width / 12, 0, width / 12, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${author}_$date',
                        style: Theme
                            .of(context)
                            .textTheme
                            .bodyMedium,
                      ),
                      Row(
                        children: [
                          Text(
                            '$view',
                            style: Theme
                                .of(context)
                                .textTheme
                                .bodyMedium,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Icon(
                            Icons.remove_red_eye_sharp,
                            color: Colors.white,
                            size: 16,
                          )
                        ],
                      )
                    ],
                  ),
                  Text(
                    title,
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyMedium,
                  )
                ],
              ),
            ))
      ],
    );
  }
}
