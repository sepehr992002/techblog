import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../components/api_constant.dart';
import '../../model/article_model.dart';
import '../../services/dio_service.dart';

class ManageArticleController extends GetxController{
  RxList<ArticleModel> articleList = RxList.empty();
  @override
  onInit(){
    super.onInit();
    getManageArticle();
  }
  getManageArticle() async{
    articleList.clear();
    //TODO get user id from get storage + user id
    // var response = await DioService().getMethod(ApiConstant.publishedByMe + GetStorage().read(StorageKey.userId));
    var response = await DioService().getMethod(ApiConstant.publishedByMe + '1');
    if (response.statusCode == 200) {
      for (var element in response.data) {
        articleList.add(ArticleModel.fromJson(element));
      }
      debugPrint(articleList[2].title.toString());
    }
  }
}