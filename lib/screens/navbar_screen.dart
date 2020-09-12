import 'package:facebook_clone_app/screens/home_screen.dart';
import 'package:facebook_clone_app/screens/account_screen.dart';
import 'package:facebook_clone_app/screens/people_screen.dart';
import 'package:facebook_clone_app/screens/setting_screen.dart';
import 'package:facebook_clone_app/screens/video_screen.dart';
import 'package:flutter/material.dart';

class NavbarScreen extends StatefulWidget {
  @override
  _NavbarScreenState createState() => _NavbarScreenState();
}

class _NavbarScreenState extends State<NavbarScreen> {
  bool _currentPage = false;
  var _icons = [Icons.home, Icons.live_tv, Icons.account_circle, Icons.people, Icons.settings];
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  List<Widget> _pageLists() {
    var _pages = [
      HomeScreen(
        currentPage: _currentPage,
        pageIndex: _selectedIndex,
      ),
      VideoScreen(),
      AccountScreen(),
      PeopleScreen(),
      SettingScreen()
    ];
    return _pages;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _pageLists().length,
      child: Scaffold(
        // body: IndexedStack(
        //   index: _selectedIndex,
        //   children: _pages,
        // ),
        //appBar: AppBar(bottom: _tabBarMenu()),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: _pageLists().map((e) => e).toList(),
        ),
        bottomNavigationBar: _tabBarMenu(),
      ),
    );
  }

  Widget _tabBarMenu() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 1,
            color: Colors.grey,
          ),
        ),
      ),
      child: TabBar(
        indicator: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.blue,
              width: 2.0,
            ),
          ),
        ),
        labelPadding: EdgeInsets.all(10),
        tabs: _icons
            .asMap()
            .entries
            .map(
              (e) => Icon(
                _icons[e.key],
                size: 30,
                color: e.key == _selectedIndex ? Colors.blue : null,
              ),
            )
            .toList(),
        onTap: (index) {
          setState(() {
            if (index == _selectedIndex) {
              _currentPage = true;
            } else {
              _currentPage = false;
            }
            _selectedIndex = index;
            print("nav $_currentPage");
          });
        },
      ),
    );

    //  BottomNavigationBar(
    //   backgroundColor: Colors.blueGrey,
    //   type: BottomNavigationBarType.fixed,
    //   currentIndex: selectedIndex,
    //   items: _icons
    //       .asMap()
    //       .entries
    //       .map(
    //         (e) => BottomNavigationBarItem(
    //           icon: Icon(
    //             _icons[e.key],
    //             color: e.key == selectedIndex ? Colors.white : Colors.black,
    //           ),
    //           title: SizedBox.shrink(),
    //         ),
    //       )
    //       .toList(),
    //   onTap: (index) {
    //     setState(() {
    //       selectedIndex = index;
    //     });
    //   },
    // ),
  }
}
