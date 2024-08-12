import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tech_blog/model/article_info_model.dart';
import '../../components/api_constant.dart';
import '../../model/article_model.dart';
import '../../model/tag_model.dart';
import '../../services/dio_service.dart';

class ManageArticleController extends GetxController {
  RxList<ArticleModel> articleList = RxList.empty();
  RxBool loading = false.obs;
  Rx<ArticleInfoModel> articleInfoModel = ArticleInfoModel(
          'اینجا عنوان مقاله قرار میگیره یه عنوان جذب انتخاب کن',
          '',
          'نوشته ابی رنگ بالا رو لمس کن تا وارد ویرایشگر بشی')
      .obs;
  RxList<TagModel> tagList = RxList.empty();

  @override
  onInit() {
    super.onInit();
    getManageArticle();
  }

  getManageArticle() async {
    loading.value = true;
    //TODO get user id from get storage + id
    // var response = await DioService().getMethod(ApiConstant.publishedByMe + GetStorage().read(StorageKey.userId));
    var response =
        await DioService().getMethod(ApiConstant.publishedByMe + '1');
    if (response.statusCode == 200) {
      for (var element in response.data) {
        articleList.add(ArticleModel.fromJson(element));
      }
      debugPrint(articleList[2].title.toString());
      loading.value = false;
    }
  }
}
