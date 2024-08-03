import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:tech_blog/components/my_colors.dart';
import 'package:tech_blog/view/screens/article_list_screen.dart';

import 'gen/assets.gen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: MyColors.statusBarColor,
      systemNavigationBarColor: MyColors.systemNavigationBarColor,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark));
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
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a purple toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: ArticleListScreen(title: 'مقالات جدید',));
  }
}
