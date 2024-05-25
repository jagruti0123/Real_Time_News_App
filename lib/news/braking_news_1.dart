import 'package:flutter/material.dart';
import 'package:news_api_task/home_screen.dart';
import 'package:news_api_task/news/detail_news.dart';

class BrakingNewsPage extends StatefulWidget {
  final String img;
  final String description;
  final String title;
  final String publishedAt;
  final String name;
  final String content;
  final String url;

  const BrakingNewsPage({
    super.key,
    required this.img,
    required this.description,
    required this.title,
    required this.publishedAt,
    required this.name,
    required this.content,
    required this.url,
  });
  @override
  State<BrakingNewsPage> createState() => _BrakingNewsPageState();
}

class _BrakingNewsPageState extends State<BrakingNewsPage> {
  bool isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    // String cont =
    //     widget.content.toString().substring(0, widget.content.length - 15);
    return Scaffold(
      appBar: AppBar(
        //toolbarHeight: 50,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Color(0xffef5252),
        title: Text('News',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 8, left: 5, right: 5),
              decoration: BoxDecoration(),
              child: Text(
                "${widget.title}",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Playfair Display',),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 5),
              child: Center(
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Aligns children to the center
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "${widget.name} | ${widget.publishedAt}",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color(0xff757575),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 210,
              margin: EdgeInsets.only(top: 5, bottom: 15, left: 1, right: 1),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    widget.img != null && widget.img.isNotEmpty ? widget.img : defaultImageUrl,
                  ),
                  fit: BoxFit.fill,
                ),),
            ),
            Container(
              margin: EdgeInsets.only(left: 5),
              child: Text(
                "${widget.description}\n",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  fontFamily: 'Raleway',
                  color: Color(0xff757575),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 5),
              child: Text(
                "${widget.content}",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    fontFamily: 'Raleway',
                    color: Color(0xff757575)),
              ),
            ),
            Container(
                margin: EdgeInsets.all(5),
                alignment: Alignment.centerLeft,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailNews(
                                  url: widget.url,
                                  title: widget.title,
                              name: widget.name
                                )));
                  },
                  child: Text(
                    'Read Full Article',
                    style: TextStyle(color: Color(0xffef5252)),
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}
