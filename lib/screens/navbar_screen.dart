import 'package:facebook_clone_app/screens/home_screen.dart';
import 'package:facebook_clone_app/screens/account_screen.dart';
import 'package:facebook_clone_app/screens/people_screen.dart';
import 'package:facebook_clone_app/screens/setting_screen.dart';
import 'package:facebook_clone_app/screens/video_screen.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NavbarScreen extends StatefulWidget {
  @override
  _NavbarScreenState createState() => _NavbarScreenState();
}

class _NavbarScreenState extends State<NavbarScreen> {
  bool _currentPage = false;
  var _icons = [
    Icons.home,
    Icons.live_tv,
    Icons.account_circle,
    Icons.people,
    Icons.menu,
  ];
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
        appBar: _appBar(),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: _pageLists().map((e) => e).toList(),
        ),
        //bottomNavigationBar: _tabBarMenu(),
      ),
    );
  }

  Widget _appBar() {
    if (_selectedIndex == 0) {
      return AppBar(
        title: Text(
          "Facebook",
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        bottom: _tabBarMenu(),
        actions: [
          ButtonWidget(
            icon: Icons.search,
            onPressed: () => print('search'),
          ),
          ButtonWidget(
            icon: MdiIcons.facebookMessenger,
            onPressed: () => print('message'),
          ),
        ],
      );
    } else {
      return AppBar(
        flexibleSpace: SafeArea(
          child: _tabBarMenu(),
        ),
      );
    }
  }

  Widget _tabBarMenu() {
    return TabBar(
      indicator: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.blue,
            width: 2.0,
          ),
        ),
      ),
      labelPadding: EdgeInsets.all(12),
      tabs: _icons
          .asMap()
          .entries
          .map(
            (e) => Center(
              child: Icon(
                _icons[e.key],
                size: 30,
                color: e.key == _selectedIndex ? Colors.blue : null,
              ),
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
