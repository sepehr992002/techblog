import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import '../../components/my_colors.dart';
import '../../controller/article/list_article_controller.dart';
import '../../controller/article/single_article_controller.dart';
import '../../gen/assets.gen.dart';
import '../widgets/main_article.dart';
import 'article_list_screen.dart';

class SingleArticleScreen extends StatelessWidget {
  SingleArticleScreen({super.key});

  // SingleArticleController singleArticleController = Get.put(SingleArticleController());
  var singleArticleController =Get.find<SingleArticleController>();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Obx(
          () => singleArticleController.loading.value == false
              ? Column(
                  children: [
                    Stack(
                      children: [
                        CachedNetworkImage(
                          imageUrl: singleArticleController.articleInfoModel.value.image!,
                          imageBuilder: (context, imageProvider) {
                            return Image(
                              image: imageProvider,
                              height: 200,
                            );
                          },
                          placeholder: (context, url) {
                            return SpinKitFadingCube(
                              size: 32,
                              color: Colors.purple,
                            );
                          },
                          errorWidget: (context, url, error) {
                            return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.image_not_supported,
                                    size: 100,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Text(
                                    'could not load image',
                                    style: TextStyle(color: Colors.black),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                        Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      end: Alignment.bottomCenter,
                                      begin: Alignment.topCenter,
                                      colors: GradientColors.singleAppBarGradient)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Icon(
                                    Icons.share,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                  Expanded(child: SizedBox()),
                                  Icon(
                                    Icons.bookmark_border_rounded,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                ],
                              ),
                            ))
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        singleArticleController.articleInfoModel.value.title!,
                        maxLines: 2,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Image.asset(
                            Assets.images.profileAvatar.path,
                            width: 50,
                            height: 50,
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Text(
                            singleArticleController.articleInfoModel.value.author!,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Text(singleArticleController.articleInfoModel.value.createdAt!)
                        ],
                      ),
                    ),
                    HtmlWidget(enableCaching: true, onErrorBuilder: (context, element, error) {
                      return SpinKitFadingCube();
                    }, singleArticleController.articleInfoModel.value.content!),
                    SizedBox(
                      height: 70,
                      child: Obx(
                        () => ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: singleArticleController.relatedTags.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () async {
                                var tagId = singleArticleController.relatedTags[index].id!;
                                await Get.find<ListArticleController>().getArticleListWithTagId(tagId);
                                Get.to(
                                    ArticleListScreen(
                                      title: singleArticleController.relatedTags[index].title!,
                                    ),
                                    arguments: [singleArticleController.relatedTags[index].title]);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 80,
                                  height: 30,
                                  decoration:
                                      BoxDecoration(borderRadius: BorderRadius.circular(16), color: Colors.grey),
                                  child: Text(singleArticleController.relatedTags[index].title!),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      height: height / 3.5,
                      child: Obx(
                        () => ListView.builder(
                          itemCount: singleArticleController.relatedArticles.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                singleArticleController
                                    .getArticleInfo(int.parse(singleArticleController.relatedArticles[index].id!));
                              },
                              child: MainArticle(
                                  height: height,
                                  width: width,
                                  imagePath: singleArticleController.relatedArticles[index].image!,
                                  views: int.parse(singleArticleController.relatedArticles[index].view!),
                                  writer: singleArticleController.relatedArticles[index].author != null
                                      ? singleArticleController.relatedArticles[index].author!
                                      : 'Unknown',
                                  title: singleArticleController.relatedArticles[index].title != null
                                      ? singleArticleController.relatedArticles[index].title!
                                      : 'undefined',
                                  index: index,
                                  bodyMargin: 30),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                )
              : SpinKitFadingCube(
                  size: 32,
                  color: Colors.purple,
                ),
        ),
      ),
    ));
  }
}
