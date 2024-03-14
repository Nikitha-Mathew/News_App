import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_application2/model/model.dart';

class CategoryController with ChangeNotifier {
  List<String> categoryList = [
    "Business",
    "Entertainment",
    "General",
    "Health",
    "Science",
    "Sports",
    "Technology"
  ];
  String category = "business";

  onTap({required int index}) {
    category = categoryList[index].toLowerCase();
    fetchData();
    print(category);
    notifyListeners();
  }

  late NewsModel newsModel;
  bool isLoading = false;

  fetchData() async {
    isLoading = true;
    final url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=0a76697f5ba44fda8a9ddcc2e4eaaa52");
    print(category);
    final response = await http.get(url);
    print(response.statusCode);
    Map<String, dynamic> decodedData = {};

    if (response.statusCode == 200) {
      decodedData = jsonDecode(response.body);
    } else {
      print("Api got failed");
    }
    newsModel = NewsModel.fromJson(decodedData);
    isLoading = false;
    notifyListeners();
  }
}
