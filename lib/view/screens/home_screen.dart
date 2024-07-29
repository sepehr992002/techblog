import 'package:flutter/material.dart';
import 'package:tech_blog/components/my_texts.dart';
import '../../components/fake_data.dart';
import '../../gen/assets.gen.dart';
import '../../components/my_colors.dart';
import '../widgets/home_screen_poster.dart';
import '../widgets/main_tags.dart';

class HomeScreen extends StatelessWidget {
  final double bodyMargin;

  const HomeScreen({super.key, required this.bodyMargin});

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
    return SingleChildScrollView(
      child: Column(
        children: [
          HomeScreenPoster(
              view: int.parse(homePagePosterMap['view']),
              author: homePagePosterMap['writer'],
              date: homePagePosterMap['date'],
              title: homePagePosterMap['title'],
              imagePath: homePagePosterMap["imageAsset"]),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tagList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.fromLTRB(0, 8, index == 0 ? bodyMargin : 15, 8),
                  child: MainTags(index: index),
                );
              },
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Padding(
            padding: EdgeInsets.only(right: bodyMargin, bottom: 8),
            child: Row(
              children: [
                Image.asset(
                  Assets.icons.bluePen.path,
                  color: MyColors.seeMore,
                  width: 16,
                  height: 16,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  MyTexts.viewHottestBlogs,
                  style: Theme
                      .of(context)
                      .textTheme
                      .labelLarge,
                )
              ],
            ),
          ),
          SizedBox(
            height: height / 3.5,
            child: ListView.builder(
              itemCount: blogList
                  .getRange(0, 5)
                  .length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
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
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: bodyMargin, bottom: 8),
            child: Row(
              children: [
                Image.asset(
                  Assets.icons.microphon.path,
                  color: MyColors.seeMore,
                  width: 16,
                  height: 16,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  MyTexts.viewHottestPodcasts,
                  style: Theme
                      .of(context)
                      .textTheme
                      .labelLarge,
                )
              ],
            ),
          ),
          SizedBox(
            height: height / 3.5,
            child: ListView.builder(
              itemCount: blogList
                  .getRange(0, 5)
                  .length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
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
              },
            ),
          ),
          SizedBox(
            height: 90,
          )
        ],
      ),
    );
  }
}