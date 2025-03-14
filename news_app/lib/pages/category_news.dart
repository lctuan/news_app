import 'package:flutter/material.dart';
import 'package:news_app/models/show_category.dart';
import 'package:news_app/pages/article_view.dart';
import 'package:news_app/services/show_category_news.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CategoryNews extends StatefulWidget {
  String name;
  CategoryNews({required this.name});

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<ShowCategoryModel> categories = [];
  bool loading = true;

  @override
  void initState() {
    getNews();
    super.initState();
  }

  getNews() async {
    ShowCategoryNews showCategoryNews = ShowCategoryNews();
    await showCategoryNews.getCategoryNews(widget.name.toLowerCase());
    categories = showCategoryNews.categories;
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        margin: EdgeInsets.only(top: 40.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios_new_rounded,
                          color: Colors.white)),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 3.8,
                  ),
                  Text(
                    widget.name,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return CategoryTitle(
                        title: categories[index].title,
                        desc: categories[index].desc,
                        image: categories[index].urlToImage,
                        url: categories[index].url,
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CategoryTitle extends StatelessWidget {
  final image, title, desc, url;
  CategoryTitle({this.image, this.title, this.desc, this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ArticleView(blogUrl: url)));
      },
      child: Container(
          margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 40.0),
          child: Column(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(image),
            ),
            SizedBox(height: 5.0),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Text(
                title!,
                maxLines: 2,
                style: TextStyle(
                  color: const Color.fromARGB(188, 0, 0, 0),
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 3.0,
            ),
            Container(
              padding: EdgeInsets.only(left: 5.0, right: 5.0),
              width: MediaQuery.of(context).size.width,
              child: Text(
                desc,
                maxLines: 3,
                style: TextStyle(
                  color: const Color.fromARGB(152, 0, 0, 0),
                ),
              ),
            ),
          ])),
    );
  }
}
