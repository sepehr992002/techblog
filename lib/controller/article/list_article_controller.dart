import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../components/api_constant.dart';
import '../../model/article_model.dart';
import '../../services/dio_service.dart';


class ListArticleController extends GetxController {
  RxList<ArticleModel> articleList = RxList();
  RxBool loading = false.obs;

  @override
  onInit() {
    super.onInit();
    getArticleList();
  }

  getArticleList() async {
    loading.value = true;
    articleList.clear();
    //TODO get user id from get storage + user id
    var response = await DioService().getMethod(ApiConstant.getArticleList);
    if (response.statusCode == 200) {
      for (var element in response.data) {
        articleList.add(ArticleModel.fromJson(element));
      }
      debugPrint(articleList[2].title.toString());
      loading.value = false;
    }
  }

  getArticleListWithTagId(String tagId) async {
    articleList.clear();
    loading.value = true;
    //TODO get user id from get storage + user id
    var response = await DioService()
        .getMethod('${ApiConstant.baseUrl}article/get.php?command=get_articles_with_tag_id&tag_id=$tagId&user_id=1');
    if (response.statusCode == 200) {
      for (var element in response.data) {
        articleList.add(ArticleModel.fromJson(element));
      }
      debugPrint(articleList[2].title.toString());
      loading.value = false;
    }
  }
}
