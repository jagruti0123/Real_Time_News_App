import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:news_api_task/NewsHistoryManager.dart';
import 'package:news_api_task/favourites.dart';
import 'package:news_api_task/history.dart';
import 'package:news_api_task/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NewsFlash',
      home: ConnectivityCheck(),
    );
  }
}

class ConnectivityCheck extends StatefulWidget {
  @override
  _ConnectivityCheckState createState() => _ConnectivityCheckState();
}

class _ConnectivityCheckState extends State<ConnectivityCheck> {
  late bool isOnline;

  @override
  void initState() {
    super.initState();
    checkConnectivity();
  }

  Future<void> checkConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    setState(() {
      isOnline = connectivityResult != ConnectivityResult.none;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isOnline ? MyHomePage() : NoInternetPage();
  }
}

class NoInternetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                height: 300,
                width: 300,
                child: Image.asset('assets/Connectivity_check.png'),
              ),
                Container(
                  margin: EdgeInsets.only(top: 260,left: 95),
                  child: Text(
                    'No Internet',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                )
              ]
            ),
            // Icon(Icons.wifi_off, size: 100, color: Color(0xffef5252)),
            Text(
              'Somethimg wrong with your connection,\nplease check and try again.',textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400,color: Color(0xff757575)),
            ),
            SizedBox(height: 10),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xffe76d84), // Background color
                ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ConnectivityCheck()),
                );
              },
              child: Text('Try Again',style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final historyStore = HistoryStore();
  late final List<Widget> _widgetOptions;

  @override
  void initState() {
    _widgetOptions = [
      Home_Screen(),
      Ctegories(),
      History(historyStore: historyStore),
    ];
    super.initState();
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final PageController controller = PageController();
  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xffe0f7fa), //0xffe0f7fa  <-- OR
      backgroundColor: Colors.white,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),

      // bottomNavigationBar: BottomBarBubble(
      //   height: 65,
      //   color: Color(0xffef5252),
      //   bubbleSize: 10,
      //   items: [
      //     BottomBarItem(
      //       iconData: Icons.home,
      //       label: 'Home',iconSize: 25,
      //     ),
      //     BottomBarItem(
      //       iconData: Icons.category,iconSize: 25,
      //       label: 'Category',
      //     ),
      //     BottomBarItem(
      //       iconData: Icons.history,iconSize: 25,
      //       label: 'History',
      //     ),
      //   ],
      //   selectedIndex: _selectedIndex,
      //   onSelect: (index) {
      //     setState(() {
      //       _selectedIndex = index;
      //     });
      //   },
      // ),
      //body: _widgetOptions.elementAt(_selectedIndex),

        bottomNavigationBar: ClipPath(
          clipper: ShapeBorderClipper(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(17),
                topRight: Radius.circular(17),
              ),
            ),
          ),
          child: BottomNavyBar(
            backgroundColor: Colors.white,
            selectedIndex: _selectedIndex,
            animationDuration: Duration(milliseconds: 400),
            showElevation: true,iconSize: 25,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            onItemSelected: (index) => setState(() {
              _selectedIndex = index;
              _onItemTapped(index);
            }),
            items: [
              BottomNavyBarItem(
                icon: Icon(Icons.home),inactiveColor: Color(0xff757575),
                title: Text('Home',),textAlign: TextAlign.center,
                activeColor: Color(0xffef5252),
              ),
              BottomNavyBarItem(
                  icon: Icon(Icons.category,),inactiveColor: Color(0xff757575),
                  title: Text('Category'),
                  textAlign: TextAlign.center,
                  activeColor: Color(0xffef5252),
              ),
              BottomNavyBarItem(
                  icon: Icon(Icons.history),inactiveColor: Color(0xff757575),
                  textAlign: TextAlign.center,
                  title: Text('History'),
                  activeColor: Color(0xffef5252)
              ),
            ],
          ),
        )

      // bottomNavigationBar: BottomBarFloating(
      //   items: items,
      //   iconSize: 23,
      //   titleStyle: TextStyle(fontSize: 11),
      //   backgroundColor: Colors.white,
      //   color: Color(0xff757575),
      //   colorSelected: Color(0xffef5252),
      //   indexSelected: _selectedIndex,
      //   onTap: (int index) => setState(() {
      //     _selectedIndex = index;
      //   }),
      // ),

      // bottomNavigationBar: BottomNavigationBar(
      //   type: BottomNavigationBarType.fixed,
      //   backgroundColor: Colors.white,
      //   unselectedItemColor: Color(0xff757575),
      //   unselectedFontSize: 15,
      //   selectedFontSize: 15,
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.home,
      //         size: 27,
      //       ),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.category,
      //         size: 27,
      //       ),
      //       label: 'Categories',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.history,
      //         size: 27,
      //       ),
      //       label: 'History',
      //     ),
      //   ],
      //   currentIndex: _selectedIndex,
      //   selectedItemColor: Color(0xffef5252),
      //
      //   selectedLabelStyle: TextStyle(
      //       fontWeight: FontWeight.bold
      //   ),
      //   unselectedLabelStyle: TextStyle(
      //       fontWeight: FontWeight.bold
      //   ),
      //   onTap: _onItemTapped,
      // ),
    );
  }

  Widget buildIndicator(bool isSelected) {
    return Container(
        margin: EdgeInsets.all(3),
        height: isSelected ? 12 : 8,
        width: isSelected ? 12 : 8,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? Color(0xff2962ff) : Colors.grey,
        )
    );
  }
}

// Rest of your code...

// import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
// import 'package:bottom_navy_bar/bottom_navy_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:news_api_task/NewsHistoryManager.dart';
// import 'package:news_api_task/favourites.dart';
// import 'package:news_api_task/history.dart';
// import 'package:news_api_task/home_screen.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'NewsFlash',
//       home: MyHomePage(),
//     );
//   }
// }
//
//
// class MyHomePage extends StatefulWidget {
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// const List<TabItem> items = [
//   TabItem(
//     icon: Icons.home,
//     title: 'Home',
//   ),
//   TabItem(
//     icon: Icons.category,
//     title: 'Categories',
//   ),
//   TabItem(
//     icon: Icons.history,
//     title: 'History',
//   ),
// ];
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _selectedIndex = 0;
//   final historyStore = HistoryStore();
//   late final List<Widget> _widgetOptions;
//
//   @override
//   void initState() {
//     _widgetOptions = [
//       Home_Screen(),
//       Ctegories(),
//       History(historyStore: historyStore),
//     ];
//     super.initState();
//   }
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   final PageController controller = PageController();
//   @override
//   void dispose() {
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       //backgroundColor: Color(0xffe0f7fa), //0xffe0f7fa  <-- OR
//       backgroundColor: Colors.white,
//       body: Center(
//         child: _widgetOptions.elementAt(_selectedIndex),
//       ),
//
//       // bottomNavigationBar: BottomBarBubble(
//       //   height: 65,
//       //   color: Color(0xffef5252),
//       //   bubbleSize: 10,
//       //   items: [
//       //     BottomBarItem(
//       //       iconData: Icons.home,
//       //       label: 'Home',iconSize: 25,
//       //     ),
//       //     BottomBarItem(
//       //       iconData: Icons.category,iconSize: 25,
//       //       label: 'Category',
//       //     ),
//       //     BottomBarItem(
//       //       iconData: Icons.history,iconSize: 25,
//       //       label: 'History',
//       //     ),
//       //   ],
//       //   selectedIndex: _selectedIndex,
//       //   onSelect: (index) {
//       //     setState(() {
//       //       _selectedIndex = index;
//       //     });
//       //   },
//       // ),
//       //body: _widgetOptions.elementAt(_selectedIndex),
//
//         bottomNavigationBar: ClipPath(
//           clipper: ShapeBorderClipper(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(17),
//                 topRight: Radius.circular(17),
//               ),
//             ),
//           ),
//           child: BottomNavyBar(
//             backgroundColor: Colors.white,
//             selectedIndex: _selectedIndex,
//             animationDuration: Duration(milliseconds: 400),
//             showElevation: true,iconSize: 25,
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             onItemSelected: (index) => setState(() {
//               _selectedIndex = index;
//               _onItemTapped(index);
//             }),
//             items: [
//               BottomNavyBarItem(
//                 icon: Icon(Icons.home),inactiveColor: Color(0xff757575),
//                 title: Text('Home',),textAlign: TextAlign.center,
//                 activeColor: Color(0xffef5252),
//               ),
//               BottomNavyBarItem(
//                   icon: Icon(Icons.category,),inactiveColor: Color(0xff757575),
//                   title: Text('Category'),
//                   textAlign: TextAlign.center,
//                   activeColor: Color(0xffef5252),
//               ),
//               BottomNavyBarItem(
//                   icon: Icon(Icons.history),inactiveColor: Color(0xff757575),
//                   textAlign: TextAlign.center,
//                   title: Text('History'),
//                   activeColor: Color(0xffef5252)
//               ),
//             ],
//           ),
//         )
//
//       // bottomNavigationBar: BottomBarFloating(
//       //   items: items,
//       //   iconSize: 23,
//       //   titleStyle: TextStyle(fontSize: 11),
//       //   backgroundColor: Colors.white,
//       //   color: Color(0xff757575),
//       //   colorSelected: Color(0xffef5252),
//       //   indexSelected: _selectedIndex,
//       //   onTap: (int index) => setState(() {
//       //     _selectedIndex = index;
//       //   }),
//       // ),
//
//       // bottomNavigationBar: BottomNavigationBar(
//       //   type: BottomNavigationBarType.fixed,
//       //   backgroundColor: Colors.white,
//       //   unselectedItemColor: Color(0xff757575),
//       //   unselectedFontSize: 15,
//       //   selectedFontSize: 15,
//       //   items: const <BottomNavigationBarItem>[
//       //     BottomNavigationBarItem(
//       //       icon: Icon(
//       //         Icons.home,
//       //         size: 27,
//       //       ),
//       //       label: 'Home',
//       //     ),
//       //     BottomNavigationBarItem(
//       //       icon: Icon(
//       //         Icons.category,
//       //         size: 27,
//       //       ),
//       //       label: 'Categories',
//       //     ),
//       //     BottomNavigationBarItem(
//       //       icon: Icon(
//       //         Icons.history,
//       //         size: 27,
//       //       ),
//       //       label: 'History',
//       //     ),
//       //   ],
//       //   currentIndex: _selectedIndex,
//       //   selectedItemColor: Color(0xffef5252),
//       //
//       //   selectedLabelStyle: TextStyle(
//       //       fontWeight: FontWeight.bold
//       //   ),
//       //   unselectedLabelStyle: TextStyle(
//       //       fontWeight: FontWeight.bold
//       //   ),
//       //   onTap: _onItemTapped,
//       // ),
//     );
//   }
//
//   Widget buildIndicator(bool isSelected) {
//     return Container(
//         margin: EdgeInsets.all(3),
//         height: isSelected ? 12 : 8,
//         width: isSelected ? 12 : 8,
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           color: isSelected ? Color(0xff2962ff) : Colors.grey,
//         )
//     );
//   }
// }