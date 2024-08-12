import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:tech_blog/controller/article/manage_article_controller.dart';
import 'package:tech_blog/services/pick_file.dart';
import '../../components/my_colors.dart';
import '../../controller/file_controller.dart';
import '../../gen/assets.gen.dart';

class SingleManageArticleScreen extends StatelessWidget {
  SingleManageArticleScreen({super.key});

  // SingleArticleController singleArticleController = Get.put(SingleArticleController());
  var manageArticleController = Get.find<ManageArticleController>();
  FilePickerController filePickerController = Get.put(FilePickerController());


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Obx(() => Column(
              children: [
                Stack(
                  children: [
                    filePickerController.file.value.name=='nothing'?
                    CachedNetworkImage(
                      imageUrl:
                          manageArticleController.articleInfoModel.value.image!,
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
                    ):Image.file(File(filePickerController.file.value.path!)),
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
                              GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                              Expanded(child: SizedBox()),
                            ],
                          ),
                        )),
                    Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: GestureDetector(
                            onTap: () {
                              // pick file
                              filePicker();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'انتخاب تصویر',
                                  ),
                                  Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                              height: 30,
                              width: Get.width / 3,
                              decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(16),
                                      topRight: Radius.circular(16))),
                            ),
                          ),
                        ))
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    manageArticleController.articleInfoModel.value.title!,
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
                      // Text(
                      //   manageArticleController.articleInfoModel.value.author!,
                      //   style: Theme.of(context).textTheme.headlineMedium,
                      // ),
                      // SizedBox(
                      //   width: 16,
                      // ),
                      // Text(manageArticleController.articleInfoModel.value.createdAt!)
                    ],
                  ),
                ),
                HtmlWidget(
                    enableCaching: true,
                    textStyle: TextStyle(color: Colors.black),
                    onErrorBuilder: (context, element, error) {
                  return SpinKitFadingCube();
                }, manageArticleController.articleInfoModel.value.content!),
                SizedBox(
                  height: 12,
                ),

                Text(
                  'ویرایش عنوان مقاله',
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'ویرایش متن اصلی مقاله',
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(
                  height: 12,
                ),

                Text(
                  'انتخاب دسته بندی',
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(
                  height: 12,
                ),

                // SizedBox(
                //   height: 70,
                //   child: Obx(
                //     () => ListView.builder(
                //       scrollDirection: Axis.horizontal,
                //       itemCount: manageArticleController.tagList.length,
                //       itemBuilder: (context, index) {
                //         return GestureDetector(
                //           onTap: () async {
                //             var tagId = manageArticleController.tagList[index].id!;
                //             await Get.find<ListArticleController>().getArticleListWithTagId(tagId);
                //             Get.to(
                //                 ArticleListScreen(
                //                   title: manageArticleController.tagList[index].title!,
                //                 ),
                //                 arguments: [manageArticleController.tagList[index].title]);
                //           },
                //           child: Padding(
                //             padding: const EdgeInsets.all(12.0),
                //             child: Container(
                //               alignment: Alignment.center,
                //               width: 80,
                //               height: 30,
                //               decoration:
                //                   BoxDecoration(borderRadius: BorderRadius.circular(16), color: Colors.grey),
                //               child: Text(manageArticleController.tagList[index].title!),
                //             ),
                //           ),
                //         );
                //       },
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 12,
                // ),
              ],
            )),
      ),
    ));
  }
}
