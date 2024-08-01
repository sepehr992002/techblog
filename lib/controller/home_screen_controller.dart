import 'package:get/get.dart';
import 'package:tech_blog/components/api_constant.dart';
import 'package:tech_blog/model/article_model.dart';
import 'package:tech_blog/model/podcast_model.dart';
import 'package:tech_blog/services/dio_service.dart';
import '../model/poster_model.dart';
import '../model/tag_model.dart';

class HomeScreenController extends GetxController {
  late Rx<PosterModel> poster = PosterModel().obs;
  late RxList<TagModel> tagsList = RxList();
  late RxList<ArticleModel> articlesList = RxList();
  late RxList<PodcastModel> podcastsList = RxList();
  RxBool loading = false.obs;
  @override
  onInit(){
    super.onInit();
    getHomeItems();
  }

  getHomeItems() async {
    loading.value = true;
    var response = await DioService().getMethod(ApiConstant.getHomeItems);
    if(response.statusCode == 200){
      for(var element in response.data['top_visited']){
        articlesList.add(ArticleModel.fromJson(element));
      }
      for(var object in response.data['top_podcasts']){
        podcastsList.add(PodcastModel.fromJson(object));
      }
      poster.value = PosterModel.fromJson(response.data['poster']);
      for(var value in response.data['tags']){
        tagsList.add(TagModel.fromJson(value));
      }
      loading.value =false;
    }
  }
}