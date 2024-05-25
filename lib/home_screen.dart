import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api_task/New/apibloc/news_api_bloc.dart';
import 'package:news_api_task/NewsHistoryManager.dart';
import 'package:news_api_task/Slider_News_API/sliderapibloc/slider_api_bloc.dart';
import 'package:news_api_task/history.dart';
import 'package:news_api_task/news/braking_news_1.dart';
import 'package:news_api_task/search_page.dart';
import 'package:share_plus/share_plus.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});
  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

final defaultImageUrl =
    'https://yt3.ggpht.com/-L8AxmJwZuy8/AAAAAAAAAAI/AAAAAAAAAAA/eZRzS7tRVX0/s900-c-k-no/photo.jpg';

class _Home_ScreenState extends State<Home_Screen> {
  NewsApiBloc newsApiBloc = NewsApiBloc();
  SliderApiBloc sliderApiBloc = SliderApiBloc();

  @override
  void initState() {
    newsApiBloc.add(NewsApiData());
    sliderApiBloc.add(SliderApiData());
    super.initState();
  }

  final CarouselController NewsController = CarouselController();
  var currentIndex = 0;

  final HistoryStore historyStore = HistoryStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //backgroundColor: Color(0xffb2ebf2), //0xffe0f7fa  <-- OR
      appBar: AppBar(
          backgroundColor: Color(0xffef5252),
          // toolbarHeight: 50,
          // flexibleSpace: Image.network(
          //   'https://images.pexels.com/photos/1061634/pexels-photo-1061634.jpeg?auto=compress&cs=tinysrgb&w=600',
          //   fit: BoxFit.cover,
          // ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchPage(),
                    ));
              },
              icon: const Icon(
                Icons.search,
                color: Colors.white,
                size: 27,
              ),
            ),
          ],
          title: Stack(
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    height: 37,
                    width: 75,
                    child: Center(
                        child: Text(
                      'News',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    )),
                  ),
                ],
              )
            ],
          )),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(right: 180),
              height: 40,
              width: 150,
              child: Center(
                child: Text(
                  "BRAKING NEWS",
                  style: TextStyle(
                      color: Color(0xff455a64),
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                ),
              ),
            ),
            Container(
              height: 235,
              child: Stack(
                children: [
                  BlocProvider(
                    create: (context) => sliderApiBloc,
                    child: BlocBuilder<SliderApiBloc, SliderApiState>(
                      builder: (context, state) {
                        if (state is SliderApiLoaded) {
                          return CarouselSlider.builder(
                            itemCount: state.sliderNewsModel.articles?.length,
                            itemBuilder: (BuildContext context, int index,
                                int realIndex) {
                              final articles = state.sliderNewsModel.articles;
                              if (articles != null && articles.length > index) {
                                final article = articles[index];
                                final urlToImage = article.image ?? '';
                                final title = article.title ?? '';
                                final description = article.description ?? '';
                                final publishedAt = article.publishedAt ?? '';
                                final name = article.source?.name ?? '';
                                final content = article.content ?? '';
                                final url = article.url ?? '';
                                if (urlToImage.isNotEmpty) {
                                  return InkWell(
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        //height: MediaQuery.of(context).size.height,
                                        margin: EdgeInsets.only(
                                            top: 10,
                                            bottom: 20,
                                            right: 5,
                                            left: 5),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Stack(
                                          children: [
                                            Stack(children: [
                                              ClipRRect(
                                                borderRadius: BorderRadius.circular(20),
                                                child: Image.network(
                                                  urlToImage.isNotEmpty ? urlToImage : defaultImageUrl,
                                                  fit: BoxFit.fill,
                                                  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                                    if (loadingProgress == null) {
                                                      return child;
                                                    } else {
                                                      return const Center(
                                                        child: CircularProgressIndicator(color: Color(0xffef5252),), // Use the default CircularProgressIndicator
                                                      );
                                                    }
                                                  },
                                                  errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                                    return Image.network(defaultImageUrl, fit: BoxFit.fill); // Display default image on error
                                                  },
                                                ),
                                              ),
                                              Positioned(
                                                top: 5,
                                                right: 5,
                                                child: Stack(
                                                  children: [
                                                    Opacity(
                                                      opacity: 0.3,
                                                      child: Container(
                                                        height: 35,
                                                        width: 35,
                                                        decoration: BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      top: 0,
                                                      left: 0,
                                                      bottom: 0,
                                                      right: 0,
                                                      child: Center(
                                                        child: IconButton(
                                                          onPressed: () {
                                                            if (url.isNotEmpty) {
                                                              Share.share(url);
                                                            } else {
                                                              // Handle the case where the URL is empty
                                                              print('URL is empty');
                                                            }
                                                          },
                                                          icon: const Icon(
                                                            Icons.share,
                                                            color: Color(0xffef5252),
                                                            size: 20,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ]),
                                            Positioned(
                                              bottom: 10,
                                              left: 0,
                                              right: 0,
                                              child: Container(
                                                padding: EdgeInsets.all(8),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(20),
                                                    bottomRight:
                                                        Radius.circular(20),
                                                  ),
                                                  color: Colors.black54,
                                                ),
                                                child: Text(
                                                  title,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      onTap: () {
                                        historyStore.addToHistory(WatchedItem(
                                            title: title,
                                            description: description,
                                            img: urlToImage));
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    BrakingNewsPage(
                                                        img: urlToImage,
                                                        description:
                                                            description,
                                                        title: title,
                                                        publishedAt:
                                                            publishedAt,
                                                        name: name,
                                                        content: content,
                                                        url: url)));
                                      });
                                } else {
                                  return Container();
                                }
                              } else {
                                return Container();
                              }
                            },
                            options: CarouselOptions(
                              autoPlay: true,
                              aspectRatio: 19 / 12.5,
                              viewportFraction: 1,
                              enlargeCenterPage: true,
                            ),
                          );
                        }
                        return Center(
                          child: CircularProgressIndicator(
                            color: Color(0xffef5252),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 190),
                  height: 40,
                  width: 150,
                  child: Center(
                    child: Text(
                      "TODAY's NEWS",
                      style: TextStyle(
                          color: Color(0xff455a64),
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                  ),
                ),
                Container(
                  child: BlocProvider(
                    create: (context) => newsApiBloc,
                    child: BlocBuilder<NewsApiBloc, NewsApiState>(
                      builder: (context, state) {
                        if (state is NewsApiLoaded) {
                          return ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: state.newsModel.articles?.length,
                              itemBuilder: (BuildContext context, int index) {
                                final articles = state.newsModel.articles;
                                if (articles != null && articles.length > index) {
                                  final article = articles[index];
                                  final urlToImage = article.urlToImage ?? '';
                                  final title = article.title ?? '';
                                  final description = article.description ?? '';
                                  final publishedAt = article.publishedAt ?? '';
                                  final name = article.source?.name ?? '';
                                  final content = article.content ?? '';
                                  final url = article.url ?? '';
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    child: InkWell(
                                        child: Stack(children: [
                                          Material(
                                            elevation: 5.0,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10,
                                                      horizontal: 5),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    width: 330,
                                                    height: 200,
                                                    child: Card(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        //set border radius more than 50% of height and width to make circle
                                                      ),
                                                      elevation: 5,
                                                      child: ClipRRect(
                                                        borderRadius: BorderRadius.circular(15),
                                                        child: Image.network(
                                                          urlToImage.isNotEmpty ? urlToImage : defaultImageUrl,
                                                          fit: BoxFit.fill,
                                                          loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                                            if (loadingProgress == null) {
                                                              return child;
                                                            } else {
                                                              return const Center(
                                                                child: CircularProgressIndicator(color: Color(0xffef5252),), // Use the default CircularProgressIndicator
                                                              );
                                                            }
                                                          },
                                                          errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                                            return Image.network(defaultImageUrl, fit: BoxFit.fill); // Display default image on error
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(height: 5),
                                                  Column(
                                                    children: [
                                                      Container(
                                                        height: 50,
                                                        width: 315,
                                                        margin: EdgeInsets.only(
                                                            left: 5),
                                                        child: Center(
                                                          child: Text(
                                                            title,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ),
                                                        ),
                                                      ),
                                                      Row(
                                                        children: [
                                                          Container(
                                                            width: 315,
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 10),
                                                            //width:
                                                            //MediaQuery.of(context).size.width / 1.8,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      right: 5,
                                                                      top: 3,
                                                                      left: 0),
                                                              child: Center(
                                                                child: Text(
                                                                  description,
                                                                  //state.newsModel.articles![index].description,
                                                                  maxLines: 2,
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black54,
                                                                      fontSize:
                                                                          13,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            top: 18,
                                            right: 14,
                                            child: Stack(
                                              children: [
                                                Opacity(
                                                  opacity: 0.3,
                                                  child: Container(
                                                    height: 35,
                                                    width: 35,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  top: 0,
                                                  left: 0,
                                                  bottom: 0,
                                                  right: 0,
                                                  child: Center(
                                                    child: IconButton(
                                                      onPressed: () {
                                                        if (url.isNotEmpty) {
                                                          Share.share(url);
                                                        } else {
                                                          // Handle the case where the URL is empty
                                                          print('URL is empty');
                                                        }
                                                      },
                                                      icon: const Icon(
                                                        Icons.share,
                                                        color: Color(0xffef5252),
                                                        size: 20,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ]),
                                        onTap: () {
                                          historyStore.addToHistory(WatchedItem(
                                              title: title,
                                              description: description,
                                              img: urlToImage));
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      BrakingNewsPage(
                                                          img: urlToImage,
                                                          description:
                                                              description,
                                                          title: title,
                                                          publishedAt:
                                                              publishedAt,
                                                          name: name,
                                                          content: content,
                                                          url: url)));
                                        }),
                                  );
                                } //if
                                else {
                                  return Container();
                                }
                              });
                        }
                        return Center(
                          // child: CircularProgressIndicator(
                          //   color: Color(0xffef5252),
                          // ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
