import 'package:get/get.dart';
import 'package:tech_blog/model/article_info_model.dart';
import '../components/api_constant.dart';
import '../services/dio_service.dart';

class SingleArticleController extends GetxController {
  Rx<ArticleInfoModel> articleInfoModel = ArticleInfoModel().obs;
  RxBool loading = false.obs;

  @override
  onInit() {
    super.onInit();
  }

  getArticleInfo(int id) async {
    //TODO setup user id later
    var userId = '';
    loading.value = true;
    var response = await DioService()
        .getMethod('${ApiConstant.baseUrl}article/get.php?command=info&id=$id&user_id=$userId');
    if (response.statusCode == 200) {
      articleInfoModel.value = ArticleInfoModel.fromJson(response.data);
      loading.value = false;
    }
  }
}
