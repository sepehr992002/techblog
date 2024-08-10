import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tech_blog/controller/article/manage_article_controller.dart';
import 'package:tech_blog/main.dart';
import 'package:tech_blog/view/article/article_list_screen.dart';
import '../../gen/assets.gen.dart';

class ManageArticles extends StatelessWidget {
  ManageArticles({super.key});
  // RegisterController registerController = Get.put(RegisterController());
  var articleMangeController = Get.find<ManageArticleController>();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: appBar('مدیریت مقاله ها'),
      body: Center(
        child: Obx(
              () => articleMangeController.articleList.isNotEmpty? ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: articleMangeController.articleList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // route to single manage
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
                          imageUrl: articleMangeController.articleList[index].image!,
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
                              articleMangeController.articleList[index].title!,
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
                                articleMangeController.articleList[index].author!,
                                style: TextStyle(color: Colors.black),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                articleMangeController.articleList[index].view! + 'بازدید',
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
          ):articleEmptyState(context),
        ),
      ),
    );
  }
  Widget articleEmptyState(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          Assets.images.tcbot,
          height: 80,
          width: 80,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
            'هنوز هیچ مقاله ای به جامعخ گیگ های فارسی اضافه نکردی'),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
            onPressed: () {
            },
            child: Text(
              'بریم برای نوشتن یه مقاله باحال',
              style: Theme.of(context).textTheme.bodyMedium,
            )),
      ],
    );
  }
}
