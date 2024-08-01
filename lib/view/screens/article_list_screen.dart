import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:tech_blog/controller/list_article_controller.dart';
import 'package:tech_blog/controller/single_article_controller.dart';
import 'package:tech_blog/view/screens/single_article_screen.dart';

class ArticleListScreen extends StatelessWidget {
  ArticleListScreen({super.key});

  ListArticleController listArticleController = Get.put(ListArticleController());
  SingleArticleController singleArticleController = Get.put(SingleArticleController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: appBar('مقالات جدید'),
      body: SizedBox(
        height: double.infinity,
        child: Obx(
          () => ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: listArticleController.articleList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  singleArticleController.getArticleInfo(int.parse(listArticleController.articleList[index].id!));
                  Get.to( SingleArticleScreen());
                  // one way to send data to the next page is using arguments
                  // Get.to(const SingleArticleScreen(), arguments: [articleController.articleList[index].id]);
                  // data is accessible in the next screen like this
                  // var id = Get.arguments[0];
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: Get.width / 3,
                        height: Get.height / 6,
                        child: CachedNetworkImage(
                          imageUrl: listArticleController.articleList[index].image!,
                          imageBuilder: (context, imageProvider) {
                            return Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  image: DecorationImage(image: imageProvider, fit: BoxFit.cover)),
                            );
                          },
                          placeholder: (context, url) {
                            return SpinKitFadingCube(
                              size: 32,
                              color: Colors.purple,
                            );
                          },
                          errorWidget: (context, url, error) {
                            return Icon(
                              Icons.image_not_supported_rounded,
                              color: Colors.grey,
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: Get.width / 2,
                            child: Text(
                              listArticleController.articleList[index].title!,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                listArticleController.articleList[index].author!,
                                style: TextStyle(color: Colors.black),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                listArticleController.articleList[index].view! + 'بازدید',
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    ));
  }
}

PreferredSize appBar(String title) {
  return PreferredSize(
    preferredSize: Size.fromHeight(60),
    child: Padding(
      padding: const EdgeInsets.all(12),
      child: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Center(child: Text(title)),
          ),
        ],
        leading: Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Container(
            child: Icon(Icons.arrow_right_rounded),
            height: 40,
            width: 40,
            decoration: BoxDecoration(color: Colors.purple, shape: BoxShape.circle),
          ),
        ),
      ),
    ),
  );
}
