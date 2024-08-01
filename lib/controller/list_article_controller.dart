import 'package:get/get.dart';
import '../components/api_constant.dart';
import '../model/article_model.dart';
import '../services/dio_service.dart';

class ListArticleController extends GetxController{
  RxList<ArticleModel> articleList = RxList();
  RxBool loading = false.obs;

  @override
  onInit(){
    super.onInit();
    getArticleList();
  }

  getArticleList() async {
    loading.value = true;
    //TODO get user id from get storage + user id
    var response = await DioService().getMethod(ApiConstant.getArticleList);
    if(response.statusCode == 200){
      for(var element in response.data){
        articleList.add(ArticleModel.fromJson(element));
      }
      print(articleList[2].title);
      loading.value =false;
    }
  }
}
