import 'package:flutter/material.dart';
import 'package:news_application2/View/bottom_nav/mainp.dart';
import 'package:news_application2/controller/bottom_controller.dart';
import 'package:news_application2/controller/category_controller.dart';
import 'package:news_application2/controller/home_screen_controller.dart';
import 'package:news_application2/controller/search_controller.dart';
import 'package:news_application2/controller/splash_controller.dart';
import 'package:news_application2/splash.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(NewsApp());
}

class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => SplashScreenProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => HomeScreenController(),
          ),
          ChangeNotifierProvider(
            create: (context) => SearchScreenController(),
          ),
          ChangeNotifierProvider(
            create: (context) => BottomNavController(),
          ),
          ChangeNotifierProvider(
            create: (context) => CategoryController(),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Consumer<SplashScreenProvider>(
            builder: (context, splashScreenProvider, _) {
              return splashScreenProvider.isLoading
                  ? Splash()
                  : MainPage(); // Replace with your home screen
            },
          ),
        ));
  }
}
