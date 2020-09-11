import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommentBottomSheetWidget extends StatefulWidget {
  final int postId;
  final ScrollController scrollController;
  final bool reverse;

  const CommentBottomSheetWidget({Key key, this.postId, this.scrollController, this.reverse = false}) : super(key: key);

  @override
  _CommentBottomSheetWidgetState createState() => _CommentBottomSheetWidgetState();
}

class _CommentBottomSheetWidgetState extends State<CommentBottomSheetWidget> {
  var _isChanged = false;
  void _printMessage() {}
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            leading: Container(
              alignment: Alignment.centerLeft,
              child: Text("${widget.postId + 1} likes"),
            ),
            trailing: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: InkWell(
                child: Icon(Icons.close, size: 25, color: Colors.white),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          child: SafeArea(
            bottom: false,
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    controller: widget.scrollController,
                    reverse: widget.reverse,
                    padding: EdgeInsets.zero,
                    physics: BouncingScrollPhysics(), //ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: widget.postId + 1,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundImage: ExactAssetImage('assets/image/man.png'),
                            ),
                            SizedBox(width: 5),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Name ${index + 1}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 2),
                                    Text("Comment ${index + 1}")
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      children: [
                        Flexible(
                          child: TextFormField(
                            controller: new TextEditingController(), // _textController,
                            // onChanged: (val) {
                            //   setState(() {
                            //     _message = val;
                            //     if (val != '') {
                            //       _isChanged = true;
                            //     } else {
                            //       _isChanged = false;
                            //     }
                            //   });
                            // },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 15),
                              hintText: "Write a comment",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.send),
                          onPressed: _isChanged ? _printMessage : null,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            // child: ListView(
            //   reverse: reverse,
            //   shrinkWrap: true,
            //   controller: scrollController,
            //   physics: ClampingScrollPhysics(),
            //   children: ListTile.divideTiles(
            //     context: context,
            //     tiles: List.generate(
            //       postId,
            //       (index) => ListTile(
            //         title: Text('Item ${index + 1}'),
            //       ),
            //     ),
            //   ).toList(),
            // ),
          ),
        ),
      ),
    );
  }
}
