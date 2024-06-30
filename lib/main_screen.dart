import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:tech_blog/fake_data.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/my_colors.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    double bodyMargin = width / 10;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
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
              Stack(
                children: [
                  Container(
                    width: width / 1.25,
                    height: height / 4.2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image:
                                AssetImage(homePagePosterMap["imageAsset"]))),
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                homePagePosterMap['writer'] +
                                    '_' +
                                    homePagePosterMap['date'],
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              Row(
                                children: [
                                  Text(
                                    homePagePosterMap['view'],
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
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
                            homePagePosterMap['title'],
                            style: Theme.of(context).textTheme.bodyMedium,
                          )
                        ],
                      ))
                ],
              ),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 60,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: tagList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.fromLTRB(
                          0, 8, index == 0 ? bodyMargin : 15, 8),
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(24),
                            ),
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: GradientColors.tags)),
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
                                style: Theme.of(context).textTheme.bodyMedium,
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
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
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      AppLocalizations.of(context)!.viewHottestPodcasts,
                      style: TextStyle(color: Colors.blue),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: height / 3.5,
                child: ListView.builder(
                  itemCount: blogList.getRange(0, 5).length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          EdgeInsets.only(right: index == 0 ? bodyMargin : 15),
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
                                          image: NetworkImage(
                                              blogList[index].imageUrl),
                                          fit: BoxFit.cover)),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          blogList[index].writer,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              blogList[index].views,
                                              style: Theme.of(context)
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
                          SizedBox(
                              width: width / 2.4,
                              child: Text(
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                blogList[index].title,
                                style: TextStyle(color: Colors.black),
                              ))
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
                      AppLocalizations.of(context)!.viewHottestBlogs,
                      style: TextStyle(color: Colors.blue),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: height / 3.5,
                child: ListView.builder(
                  itemCount: blogList.getRange(0, 5).length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          EdgeInsets.only(right: index == 0 ? bodyMargin : 15),
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
                                          image: NetworkImage(
                                              blogList[index].imageUrl),
                                          fit: BoxFit.cover)),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          blogList[index].writer,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              blogList[index].views,
                                              style: Theme.of(context)
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
                          SizedBox(
                              width: width / 2.4,
                              child: Text(
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                blogList[index].title,
                                style: TextStyle(color: Colors.black),
                              ))
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
