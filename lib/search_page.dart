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

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();

  void _navigateToItemPage(String item) {
    // 1. Determine the appropriate route and page widget based on item:
    String routeName = '/item/${item.toLowerCase()}'; // Example named route
    Widget pageWidget;

    switch (item) {
      case 'Business':
        pageWidget =
            BusinessNewsPage();
        break;
      case 'Technology':
        pageWidget =
            TechNewsPage();
        break;
      case 'Health':
        pageWidget =
            HealthNewsPage();
        break;
      case 'Sports':
        pageWidget =
            SportsNewsPage();
        break;
      case 'Science':
        pageWidget =
            ScienceNewsPage();
        break;
      case 'Crime':
        pageWidget =
            CrimeNewsPage();
        break;
      case 'Politics':
        pageWidget =
            PoliticsNewsPage();
        break;
      case 'Entertainment':
        pageWidget =
            EntNewsPage();
        break;
      case 'World':
        pageWidget =
            EduNewsPage();
        break;
      case 'Nation':
        pageWidget =
            NationNewsPage();
        break;
      default:
        pageWidget = SearchPage();
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => pageWidget,
        settings: RouteSettings(
          arguments: item,
        ),
      ),
    );
  }

  bool isSearchClicked = false;
  String searchText = '';
  List<String> items = [
    'Business',
    'Technology',
    'Health',
    'Sports',
    'Politics',
    'Entertainment',
    'Crime',
    'World',
    'Nation',
  ];

  List<String> filteredItems = [];

  @override
  void initState() {
    super.initState();
    filteredItems = List.from(items);
  }

  void _onSearchChanged(String value) {
    setState(() {
      searchText = value;
      myFilterItems();
    });
  }

  void myFilterItems() {
    if (searchText.isEmpty) {
      filteredItems = List.from(items);
    } else {
      filteredItems = items
          .where(
              (item) => item.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    }
  }

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
          "Search",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: SearchBar(
                controller: _searchController,
                onChanged: _onSearchChanged,
                backgroundColor: MaterialStateProperty.all(Colors.white),
                side: MaterialStateProperty.all(
                    const BorderSide(color: Color(0xffef5252))),
                textStyle: MaterialStateProperty.all(const TextStyle(
                    color: Color(0xffef5252), fontWeight: FontWeight.normal)),
                leading: IconButton(
                  icon: const Icon(Icons.search, color: Color(0xffef5252)),
                  onPressed: () {
                    setState(() {
                      isSearchClicked = !isSearchClicked;
                      if (isSearchClicked) {
                        _searchController.clear();
                        myFilterItems();
                      }
                    });
                  },
                ),
                hintText: 'Search...',
              ),
            ),
            Container(
              height: 500,
              width: 380,
              //color: Colors.yellow,
              child: searchText.isEmpty
                  ? Container(
                      height: 300,
                      child: Container(
                      ),
                    )
                  : (filteredItems.isEmpty
                      ? Container(
                          height: 300,
                          child: Center(
                            child: Text(
                              'No results found for "$searchText".',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        )
                      : ListView.builder(
                          itemCount: filteredItems.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                ListTile(
                                  title: Text(filteredItems[index]),
                                  onTap: () =>
                                      _navigateToItemPage(filteredItems[index]),
                                ),
                                // Divider(
                                //   height: 1,
                                //   color: Colors.grey,
                                // ),
                              ],
                            );
                          })),
            )
          ],
        ),
      ),
    );
  }
}
