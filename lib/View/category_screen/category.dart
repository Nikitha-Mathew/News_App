import 'package:flutter/material.dart';
import 'package:news_application2/View/widgets/newscard.dart';
import 'package:news_application2/controller/category_controller.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatelessWidget {
  void fetchData(BuildContext context) async {
    Provider.of<CategoryController>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    fetchData(context);
    return Consumer<CategoryController>(
      builder: (context, provider, child) {
        return DefaultTabController(
          length: provider.categoryList.length,
          initialIndex: 0,
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              titleTextStyle: const TextStyle(
                  color: Color.fromARGB(255, 61, 181, 232),
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
              title: const Text("Categories"),
              bottom: TabBar(
                labelStyle: const TextStyle(
                    color: Color.fromARGB(255, 61, 181, 232),
                    fontWeight: FontWeight.w600),
                labelColor: Colors.white,
                unselectedLabelColor: Color.fromARGB(255, 61, 181, 232),
                indicatorPadding: const EdgeInsets.symmetric(horizontal: 5),
                unselectedLabelStyle: const TextStyle(
                    color: Color.fromARGB(255, 61, 181, 232),
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
                overlayColor: const MaterialStatePropertyAll(Colors.white),
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                    color: Color.fromARGB(255, 61, 181, 232),
                    borderRadius: BorderRadius.circular(10)),
                isScrollable: true,
                tabs: List.generate(
                  provider.categoryList.length,
                  (index) => Tab(
                    text: provider.categoryList[index],
                  ),
                ),
                onTap: (value) {
                  provider.onTap(index: value);
                },
              ),
            ),
            body: provider.isLoading == true
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
                              date: provider
                                  .newsModel.articles?[index].publishedAt,
                              imageUrl: provider
                                      .newsModel.articles?[index].urlToImage
                                      .toString() ??
                                  "",
                              contant: provider
                                      .newsModel.articles?[index].content
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
                  ),
          ),
        );
      },
    );
  }
}
