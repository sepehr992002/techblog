import 'package:get/get.dart';
import 'package:tech_blog/controller/article/manage_article_controller.dart';
import 'package:tech_blog/controller/register_controller.dart';
import 'package:tech_blog/controller/article/single_article_controller.dart';

import 'controller/article/list_article_controller.dart';

class ArticleBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(ListArticleController());
    Get.lazyPut(() {
      // lazy put is called only when it is needed to be called and it will be deleted from the ram
      // when it is not necessary
      return SingleArticleController();
    },);
  }

}


class RegisterBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(RegisterController());
  }

}

class ArticleManagerBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(ManageArticleController());

  }

}