import 'package:flutter/material.dart';
import 'package:news_api_task/Business_News_API/pages/business_news_page.dart';
import 'package:news_api_task/Crime_News_API/pages/crime_news_page.dart';
import 'package:news_api_task/Edu_News_API/pages/edu_news_page.dart';
import 'package:news_api_task/Entertainment_News_API/pages/ent_news_page.dart';
import 'package:news_api_task/Health_News_API/pages/health_news_page.dart';
import 'package:news_api_task/Nation_News_API/pages/nation_news_page.dart';
import 'package:news_api_task/Politics_News_API/pages/politics_news_page.dart';
import 'package:news_api_task/Science_News_API/pages/science_news_page.dart';
import 'package:news_api_task/Sports_News_API/pages/sports_news_page.dart';
import 'package:news_api_task/Tech_News_API/pages/tech_news_page.dart';

class Ctegories extends StatefulWidget {
  const Ctegories({super.key});

  @override
  State<Ctegories> createState() => _CtegoriesState();
}

class _CtegoriesState extends State<Ctegories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //toolbarHeight: 50,
        backgroundColor: Color(0xffef5252),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          "Categories",
          style: TextStyle(color: Colors.white,),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  height: 100,
                  width: 160,
                  child: Stack(children: [
                    ClipRRect(
                      child: Image.asset('assets/img_5.png',fit: BoxFit.cover,height: 100,width: 160,),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black38,
                            borderRadius: BorderRadius.circular(6)),
                        child: Center(
                            child: Text(
                          'Sports',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SportsNewsPage(),
                              //builder: (context) => BookmarkProvider(),
                            ));
                      },
                    )
                  ]),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  height: 100,
                  width: 160,
                  child: Stack(children: [
                    ClipRRect(
                      child: Image.asset('assets/img_4.png',fit: BoxFit.cover,height: 100,width: 160,),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black38,
                            borderRadius: BorderRadius.circular(6)),
                        child: Center(
                            child: Text(
                              'Technology',
                              style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold),
                            )),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TechNewsPage(),
                            ));
                      },
                    )
                  ]),
                ),
              ],
            ),

            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  height: 100,
                  width: 160,
                  child: Stack(children: [
                    ClipRRect(
                      child: Image.asset('assets/img_3.png',fit: BoxFit.cover,height: 100,width: 160,),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black38,
                            borderRadius: BorderRadius.circular(6)),
                        child: Center(
                            child: Text(
                              'Politics',
                              style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold),
                            )),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PoliticsNewsPage(),
                            ));
                      },
                    )
                  ]),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  height: 100,
                  width: 160,
                  child: Stack(children: [
                    ClipRRect(
                      child: Image.asset('assets/img_2.png',fit: BoxFit.cover,height: 100,width: 160,),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black38,
                            borderRadius: BorderRadius.circular(6)),
                        child: Center(
                            child: Text(
                              'Business',
                              style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold),
                            )),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BusinessNewsPage(),
                            ));
                      },
                    )
                  ]),
                ),
              ],
            ),

            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  height: 100,
                  width: 160,
                  child: Stack(children: [
                    ClipRRect(
                      child: Image.asset('assets/img_1.png',fit: BoxFit.cover,height: 100,width: 160,),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black38,
                            borderRadius: BorderRadius.circular(6)),
                        child: Center(
                            child: Text(
                              'Health',
                              style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold),
                            )),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HealthNewsPage(),
                            ));
                      },
                    )
                  ]),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  height: 100,
                  width: 160,
                  child: Stack(children: [
                    ClipRRect(
                      child: Image.asset('assets/img.png',fit: BoxFit.cover,height: 100,width: 160,),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black38,
                            borderRadius: BorderRadius.circular(6)),
                        child: Center(
                            child: Text(
                              'Crime',
                              style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold),
                            )),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CrimeNewsPage(),
                            ));
                      },
                    )
                  ]),
                ),
              ],
            ),

            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  height: 100,
                  width: 160,
                  child: Stack(children: [
                    ClipRRect(
                      child: Image.asset('assets/img_7.png',fit: BoxFit.cover,height: 100,width: 160,),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black38,
                            borderRadius: BorderRadius.circular(6)),
                        child: Center(
                            child: Text(
                              'Entertainment',
                              style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold),
                            )),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EntNewsPage(),
                            ));
                      },
                    )
                  ]),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  height: 100,
                  width: 160,
                  child: Stack(children: [
                    ClipRRect(
                      child: Image.asset('assets/img_8.png',fit: BoxFit.cover,height: 100,width: 160,),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black38,
                            borderRadius: BorderRadius.circular(6)),
                        child: Center(
                            child: Text(
                              'Science',
                              style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold),
                            )),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ScienceNewsPage(),
                            ));
                      },
                    )
                  ]),
                ),
              ],
            ),

            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  height: 100,
                  width: 160,
                  child: Stack(children: [
                    ClipRRect(
                      child: Image.asset('assets/img_11.png',fit: BoxFit.cover,height: 100,width: 160,),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black38,
                            borderRadius: BorderRadius.circular(6)),
                        child: Center(
                            child: Text(
                              'World',
                              style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold),
                            )),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EduNewsPage(),
                            ));
                      },
                    )
                  ]),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  height: 100,
                  width: 160,
                  child: Stack(children: [
                    ClipRRect(
                      child: Image.asset('assets/img_10.png',fit: BoxFit.cover,height: 100,width: 160,),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black38,
                            borderRadius: BorderRadius.circular(6)),
                        child: Center(
                            child: Text(
                              'Nation',
                              style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold),
                            )),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NationNewsPage(),
                            ));
                      },
                    )
                  ]),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
