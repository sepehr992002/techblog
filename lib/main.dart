import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:tech_blog/binding.dart';
import 'package:tech_blog/components/my_colors.dart';
import 'package:tech_blog/view/article/manage_articles.dart';
import 'package:tech_blog/view/screens/main_screen.dart';
import 'package:tech_blog/view/article/single_article_screen.dart';
import 'package:tech_blog/view/screens/splash_screen.dart';
import 'package:get_storage/get_storage.dart';
import 'gen/assets.gen.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: MyColors.statusBarColor,
      systemNavigationBarColor: MyColors.systemNavigationBarColor,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark));
  await GetStorage.init();
  runApp(const MyApp());
}

String localeCode = 'fa';
String fontFamily = 'dana';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: RegisterBinding(),
        // binding is used for easier access to the controllers we use a lot
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        locale: Locale(localeCode),
        supportedLocales: AppLocalizations.supportedLocales,
        theme: ThemeData(
          inputDecorationTheme: InputDecorationTheme(
              fillColor: Colors.white,
              filled: true,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style:
                  ButtonStyle(backgroundColor: WidgetStateProperty.resolveWith(
            (states) {
              if (states.contains(WidgetState.pressed)) {
                return Colors.blue;
              }
              return MyColors.primaryColor;
            },
          ), textStyle: WidgetStateProperty.resolveWith(
            (states) {
              if (states.contains(WidgetState.pressed)) {
                return TextStyle(fontSize: 25);
              }
              return TextStyle(fontSize: 20);
            },
          ))),
          fontFamily: Assets.fonts.danaRegular,
          textTheme: TextTheme(
              labelLarge: TextStyle(
                  color: MyColors.seeMore,
                  fontFamily: fontFamily,
                  fontSize: 12),
              headlineMedium: TextStyle(
                  color: Colors.grey, fontFamily: fontFamily, fontSize: 12),
              titleMedium: TextStyle(
                  color: Colors.black, fontFamily: fontFamily, fontSize: 12),
              bodyMedium: TextStyle(
                  color: Colors.white, fontFamily: fontFamily, fontSize: 12)),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        getPages: [
          // routing to pages by their name
          GetPage(name: NamedRoute.routeMainScreen, page: () => MainScreen(),binding: RegisterBinding()),
          GetPage(name: NamedRoute.routeSingleArticle, page: () => SingleArticleScreen(),binding: ArticleBinding()),
          GetPage(name: NamedRoute.routeManageArticles, page: () => ManageArticles(),binding: ArticleManagerBinding()),
        ],
        home: SplashScreen());
  }
}





class NamedRoute{
  static String routeMainScreen = '/MainScreen';
  static String routeSingleArticle = '/SingleArticle';
  static String routeManageArticles = '/ManageArticles';
}