import 'package:get/get.dart';
import 'package:tech_blog/components/api_constant.dart';
import 'package:tech_blog/model/article_model.dart';
import 'package:tech_blog/model/podcast_model.dart';
import 'package:tech_blog/services/dio_service.dart';
import '../model/poster_model.dart';
import '../model/tag_model.dart';

class HomeScreenController extends GetxController {
  late Rx<PosterModel> poster;
  late RxList<TagModel> tagsList = RxList();
  late RxList<ArticleModel> articlesList = RxList();
  late RxList<PodcastModel> podcastsList = RxList();
  @override
  onInit(){
    super.onInit();
    getHomeItems();
  }

  getHomeItems() async {
    var response = await DioService().getMethod(ApiConstant.getHomeItems);
    if(response.statusCode == 200){
      for(var element in response.data['top_visited']){
        articlesList.add(ArticleModel.fromJson(element));
      }
      print(articlesList[2].title);
      for(var object in response.data['top_podcasts']){
        podcastsList.add(PodcastModel.fromJson(object));
      }
      print(podcastsList[1].author);
    }
  }
}