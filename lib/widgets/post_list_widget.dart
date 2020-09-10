import 'package:facebook_clone_app/widgets/comment_widget.dart';
import 'package:facebook_clone_app/widgets/divider_widget.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PostListWidget extends StatelessWidget {
  final int postId;

  const PostListWidget({Key key, this.postId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _plural = "";
    if (postId > 0) {
      _plural = "s";
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: postId % 2 == 0
                          ? BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.blue, width: 2),
                            )
                          : null,
                      child: CircleAvatar(
                        backgroundImage: ExactAssetImage('assets/image/man.png'),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name ${postId + 1}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Text("${postId + 1}m . "),
                            Icon(Icons.public, size: 12),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              IconButton(
                icon: Icon(Icons.more_horiz),
                onPressed: () => print('moresetting'),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
          child: Text("Hello post ${postId + 1}"),
        ),
        postId % 2 == 0
            ? Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        opaque: false,
                        pageBuilder: (BuildContext context, _, __) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Scaffold(
                              body: Container(
                                width: double.infinity,
                                height: double.infinity,
                                color: Colors.black.withOpacity(0.9),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Hero(
                                        tag: postId,
                                        child: Image.asset(
                                          'assets/image/flower.png',
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "This is post number ${postId + 1}",
                                        style: TextStyle(color: Colors.white),
                                        textAlign: TextAlign.right,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                  child: Hero(
                    tag: postId,
                    child: ClipRRect(
                      //child: Container(
                      child: Image.asset(
                        'assets/image/flower.png',
                        width: double.infinity,
                        fit: BoxFit.cover,
                        height: 280,
                      ),
                      //),
                    ),
                  ),

                  // child: Image.asset(
                  //   'assets/image/flower.png',
                  //   width: double.infinity,
                  //   fit: BoxFit.cover,
                  //   height: 280,
                  // ),
                ),
              )
            : SizedBox.shrink(),
        Container(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${postId + 1}'),
              Text('${postId + 1} Comment$_plural . ${postId + 1} Share$_plural'),
            ],
          ),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FlatButton.icon(
                onPressed: () => print('like'),
                icon: Icon(MdiIcons.thumbUpOutline),
                label: Text("Like"),
              ),
              FlatButton.icon(
                onPressed: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      opaque: false,
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return CommentWidget(postId: postId + 1);
                      },
                      transitionsBuilder: (context, animation, secondaryAnimation, child) {
                        // return Align(
                        //   child: FadeTransition(
                        //     opacity: animation,
                        //     child: child,
                        //   ),
                        // );
                        return SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(0, 1),
                            end: Offset.zero,
                          ).animate(animation),
                          child: child,
                        );
                      },
                    ),
                  );
                },
                icon: Icon(MdiIcons.commentOutline),
                label: Text("Comment"),
              ),
              FlatButton.icon(
                onPressed: () => print('share'),
                icon: Icon(MdiIcons.shareOutline),
                label: Text("Share"),
              ),
            ],
          ),
        ),
        DividerWidget(),
      ],
    );
  }
}
