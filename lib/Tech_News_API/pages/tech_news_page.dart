import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api_task/NewsHistoryManager.dart';
import 'package:news_api_task/Tech_News_API/technewsbloc/tech_api_bloc.dart';
import 'package:news_api_task/history.dart';
import 'package:news_api_task/home_screen.dart';
import 'package:news_api_task/news/braking_news_1.dart';
import 'package:share_plus/share_plus.dart';

class TechNewsPage extends StatefulWidget {
  const TechNewsPage({super.key});

  @override
  State<TechNewsPage> createState() => _TechNewsPageState();
}

class _TechNewsPageState extends State<TechNewsPage> {
  TechApiBloc techApiBloc = TechApiBloc();

  @override
  void initState() {
    techApiBloc.add(TechApiData());
    super.initState();
  }

  final HistoryStore historyStore = HistoryStore();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffef5252),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          "Technology News",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),

        body: Center(
          child: SingleChildScrollView(
            child: Column(
              //height: MediaQuery.of(context).size.height*10.2,
                children:[
                  BlocProvider(
                  create: (context) => techApiBloc,
                  child: BlocBuilder<TechApiBloc, TechApiState>(
                    builder: (context, state) {
                      if (state is TechApiLoading) {
                        // Display CircularProgressIndicator while loading
                        return Center(
                          child: CircularProgressIndicator(color: Color(0xffef5252),),
                        );
                      }
                      else if (state is TechApiLoaded) {
                        return ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: state.techNewsModel.articles?.length,
                            itemBuilder: (BuildContext context, int index) {
                              final results = state.techNewsModel.articles;
                              if (results != null && results.length > index) {
                                final result = results[index];
                                final urlToImage = result.image?? '';
                                final title = result.title?? '';
                                final description = result.description?? '';
                                final publishedAt = result.publishedAt?? '';
                                final name = result.source?.name?? '';
                                final content = result.content?? '';
                                final url = result.url?? '';
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  child: InkWell(
                                      child: Stack(
                                        children: [
                                          Material(
                                          elevation: 5.0,
                                          borderRadius: BorderRadius.circular(10),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 5),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: 330,
                                                  height: 200,
                                                  child: Card(
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(15),
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
                                                      margin:
                                                      EdgeInsets.only(left: 5),
                                                      //color: Colors.redAccent,
                                                      // width: MediaQuery.of(context)
                                                      //         .size
                                                      //         .width /
                                                      //     1.8,
                                                      child: Center(
                                                        child: Text(
                                                          title,
                                                          style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 15,
                                                              fontWeight:
                                                              FontWeight.w500),
                                                        ),
                                                      ),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Container(
                                                          width: 315,
                                                          margin: EdgeInsets.only(
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
                                                                    fontSize: 13,
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
                                        ],
                                      ),
                                      onTap: () {
                                        historyStore.addToHistory(WatchedItem(
                                            title: title,
                                            description: description,
                                            img: urlToImage
                                        ));
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    BrakingNewsPage(img: urlToImage, description: description, title: title,publishedAt:publishedAt,name: name,content: content,url: url)
                                            ));
                                      }),
                                );
                              } //if
                              else {
                                return Container();
                              }
                            });
                      }
                      return Container();
                    },
                  ),
                ),]
            ),
          ),
        )
    );
  }
}