import 'package:flutter/material.dart';
import 'package:news_application2/View/widgets/newscard.dart';
import 'package:news_application2/controller/home_screen_controller.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  void fetchData(BuildContext context) {
    Provider.of<HomeScreenController>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    fetchData(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 78, 160, 218),
          elevation: 0,
          title: Row(
            children: [
              const Text(
                "News Today ",
              ),
              Icon(Icons.book)
            ],
          ),
          titleTextStyle: const TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
        ),
        body:
            Consumer<HomeScreenController>(builder: (context, provider, child) {
          return provider.isLoading == true
              ? Center(
                  child: Text(
                  "Latest News",
                  style: TextStyle(fontSize: 20),
                ))
              : Padding(
                  padding: const EdgeInsets.all(10),
                  child: ListView.separated(
                      itemBuilder: (context, index) => NewsCard(
                            title: provider.newsModel.articles?[index].title
                                    .toString() ??
                                "",
                            description: provider
                                    .newsModel.articles?[index].description
                                    .toString() ??
                                "",
                            date:
                                provider.newsModel.articles?[index].publishedAt,
                            imageUrl: provider
                                    .newsModel.articles?[index].urlToImage
                                    .toString() ??
                                "",
                            contant: provider.newsModel.articles?[index].content
                                    .toString() ??
                                "",
                            sourceName: provider
                                    .newsModel.articles?[index].source?.name
                                    .toString() ??
                                "",
                            url: provider.newsModel.articles?[index].url
                                    .toString() ??
                                "",
                          ),
                      separatorBuilder: (context, index) => const Divider(
                            height: 20,
                          ),
                      itemCount: provider.newsModel.articles?.length ?? 0),
                );
        }));
  }
}
