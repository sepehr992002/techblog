import 'package:get/get.dart';
import 'package:tech_blog/model/article_info_model.dart';
import 'package:tech_blog/model/article_model.dart';
import 'package:tech_blog/model/tag_model.dart';
import '../components/api_constant.dart';
import '../services/dio_service.dart';

class SingleArticleController extends GetxController {
  late RxList<ArticleModel> relatedArticles = RxList();
  late RxList<TagModel> relatedTags = RxList();
  Rx<ArticleInfoModel> articleInfoModel = ArticleInfoModel().obs;
  RxBool loading = false.obs;


  getArticleInfo(int id) async {
    //TODO setup user id later
    var userId = '';
    loading.value = true;
    var response = await DioService()
        .getMethod('${ApiConstant.baseUrl}article/get.php?command=info&id=$id&user_id=$userId');
    if (response.statusCode == 200) {
      articleInfoModel.value = ArticleInfoModel.fromJson(response.data);
      relatedArticles.clear();
      for(var object in response.data['related']){
        relatedArticles.add(ArticleModel.fromJson(object));
      }
      relatedTags.clear();
      for(var value in response.data['tags']){
        relatedTags.add(TagModel.fromJson(value));
      }
      loading.value = false;
    }
  }
}
