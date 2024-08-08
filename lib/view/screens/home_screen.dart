import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:tech_blog/components/my_texts.dart';
import 'package:tech_blog/controller/home_screen_controller.dart';
import 'package:tech_blog/controller/article/single_article_controller.dart';
import 'package:tech_blog/view/widgets/main_article.dart';
import 'package:tech_blog/view/widgets/main_podcast.dart';
import '../../components/fake_data.dart';
import '../../gen/assets.gen.dart';
import '../../components/my_colors.dart';
import '../article/article_list_screen.dart';
import '../widgets/home_screen_poster.dart';
import '../widgets/main_tags.dart';

class HomeScreen extends StatelessWidget {
  final double bodyMargin;

  HomeScreen({super.key, required this.bodyMargin});

  HomeScreenController homeScreenController = Get.put(HomeScreenController());
  SingleArticleController singleArticleController = Get.put(SingleArticleController());

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Obx(
        () => homeScreenController.loading.value == false
            ? Column(
                children: [
                  Obx(
                    () => HomeScreenPoster(
                        title: homeScreenController.poster.value.title!,
                        imagePath: homeScreenController.poster.value.image!),
                  ),
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
                          child: MainTags(title: homeScreenController.tagsList[index].title!),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(ArticleListScreen(title: 'مقالات جدید'));
                    },
                    child: Padding(
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
                            style: Theme.of(context).textTheme.labelLarge,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height / 3.5,
                    child: Obx(
                      () => ListView.builder(
                        itemCount: homeScreenController.articlesList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              singleArticleController
                                  .getArticleInfo(int.parse(homeScreenController.articlesList[index].id!));
                            },
                            child: MainArticle(
                                height: height,
                                width: width,
                                imagePath: homeScreenController.articlesList[index].image!,
                                views: int.parse(homeScreenController.articlesList[index].view!),
                                writer: homeScreenController.articlesList[index].author!,
                                title: homeScreenController.articlesList[index].title!,
                                index: index,
                                bodyMargin: bodyMargin),
                          );
                        },
                      ),
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
                          style: Theme.of(context).textTheme.labelLarge,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height / 3.5,
                    child: Obx(
                      () => ListView.builder(
                        itemCount: homeScreenController.podcastsList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return MainPodcast(
                            bodyMargin: bodyMargin,
                            index: index,
                            width: width,
                            height: height,
                            title: homeScreenController.podcastsList[index].title!,
                            imagePath: homeScreenController.podcastsList[index].poster!,
                            views: int.parse(homeScreenController.podcastsList[index].view!),
                            writer: homeScreenController.podcastsList[index].author != null
                                ? homeScreenController.podcastsList[index].author!
                                : 'unknown',
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 90,
                  )
                ],
              )
            : Center(
                child: SpinKitFadingCube(
                  size: 32,
                  color: MyColors.primaryColor,
                ),
              ),
      ),
    );
  }
}
