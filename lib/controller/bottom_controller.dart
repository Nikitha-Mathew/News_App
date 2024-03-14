import 'package:flutter/material.dart';
import 'package:news_application2/View/category_screen/category.dart';
import 'package:news_application2/View/home_screen/homesc.dart';
import 'package:news_application2/View/search_screen/search.dart';

class BottomNavController with ChangeNotifier {
  int selectedIndex = 1;

  void onItemTap(index) {
    selectedIndex = index;
    notifyListeners();
  }

  List<Widget> myPages = [HomeScreen(), CategoryScreen(), SearchScreen()];
}
