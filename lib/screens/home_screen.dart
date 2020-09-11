import 'dart:async';
import 'package:facebook_clone_app/widgets/divider_widget.dart';
import 'package:facebook_clone_app/widgets/live_photo_room_widget.dart';
import 'package:facebook_clone_app/widgets/post_list_widget.dart';
import 'package:facebook_clone_app/widgets/room_widget.dart';
import 'package:facebook_clone_app/widgets/story_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// ignore: unused_import
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeScreen extends StatefulWidget {
  final bool currentPage;
  final int pageIndex;

  const HomeScreen({Key key, this.currentPage, this.pageIndex}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  var _scrollController = ScrollController();
  void _goTop() {
    _scrollController.animateTo(
      0.0,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOutQuart,
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    if (widget.currentPage == true && widget.pageIndex == 0) {
      _goTop();
    }

    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.transparent,
        //elevation: 0.0,
        //brightness: Brightness.light,
        //backgroundColor: Colors.white,
        title: Text(
          "Facebook",
          style: TextStyle(
            color: Color(0xFF1777F2),
            fontWeight: FontWeight.bold,
            fontSize: 24,
            letterSpacing: -1.2,
          ),
        ),
        automaticallyImplyLeading: false,
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
      ),
      body: RefreshIndicator(
        onRefresh: () {
          Completer<Null> completer = new Completer<Null>();
          Timer(new Duration(seconds: 3), () {
            completer.complete();
            Fluttertoast.showToast(msg: "Reload successfully.");
          });
          return completer.future;
        },
        child: SingleChildScrollView(
          controller: _scrollController,
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Container(
                      height: 55,
                      width: 55,
                      child: CircleAvatar(
                        backgroundImage: ExactAssetImage('assets/image/man.png'),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    //Text("What's on your mind?"),

                    Flexible(
                      child: Container(
                        height: 40,
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            hintText: "What's on your minds?",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              DividerWidget(),
              LivePhotoRoomWidget(),
              DividerWidget(),
              Container(
                height: 70,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return RoomWidget(
                      roomId: index,
                    );
                  },
                ),
              ),
              DividerWidget(),
              Container(
                height: 180,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return StroryWidget(
                      storyId: index,
                    );
                  },
                ),
              ),
              DividerWidget(),
              Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 40,
                  itemBuilder: (context, index) {
                    return PostListWidget(
                      postId: index,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class ButtonWidget extends StatelessWidget {
  final IconData icon;
  final Function onPressed;

  const ButtonWidget({Key key, this.icon, this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        shape: BoxShape.circle,
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: Icon(icon),
        onPressed: onPressed,
      ),
    );
  }
}
