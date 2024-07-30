import 'package:tech_blog/components/api_constant.dart';

class PodcastModel {
  String? id;
  String? title;
  String? poster;
  String? catName;
  String? author;
  String? view;
  String? status;
  String? createdAt;

  PodcastModel({
     this.id = 'Unknown',
     this.title = 'Unknown',
     this.poster = 'Unknown',
     this.catName = 'Unknown',
     this.author = 'Unknown',
     this.view = 'Unknown',
     this.status = 'Unknown',
     this.createdAt = 'Unknown',
  });
  PodcastModel.fromJson(Map<String,dynamic> element){
    id = element['id'];
    title = element['title'];
    poster = ApiConstant.hostDlUrl + element['poster'];
    catName = element['cat_name'];
    author = element['author'];
    view = element['view'];
    status = element['status'];
    createdAt = element['created_at'];
  }
}