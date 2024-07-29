import 'package:flutter/material.dart';
import '../../components/fake_data.dart';
import '../../components/my_colors.dart';

class MainArticle extends StatelessWidget {
  final String imagePath;
  final String writer;
  final String title;
  final int views;
  final int index;
  final double bodyMargin;
  final double width;
  final double height;

  const MainArticle({super.key,
    required this.imagePath,
    required this.views,
    required this.writer,
    required this.title,
    required this.index,
    required this.width,
    required this.height,
    required this.bodyMargin});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.only(right: index == 0 ? bodyMargin : 15),
      child: Column(
        children: [
          SizedBox(
            height: height / 5.3,
            width: width / 2.5,
            child: Stack(
              children: [
                Container(
                  foregroundDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                          image: AssetImage(homePagePosterMap["imageAsset"]), fit: BoxFit.cover)),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: GradientColors.blogPost)),
                ),
                Positioned(
                    bottom: 8,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          blogList[index].writer,
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodyMedium,
                        ),
                        Row(
                          children: [
                            Text(
                              blogList[index].views,
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
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: SizedBox(
                width: width / 2.4,
                child: Text(
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  blogList[index].title,
                  style: TextStyle(color: Colors.black),
                )),
          )
        ],
      ),
    );
  }
}
