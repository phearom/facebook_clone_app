import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CommentWidget extends StatefulWidget {
  final int postId;

  const CommentWidget({Key key, this.postId}) : super(key: key);

  @override
  _CommentWidgetState createState() => _CommentWidgetState();
}

class _CommentWidgetState extends State<CommentWidget> {
  var _isChanged = false;
  var _message = "";
  var _postId = 0;
  var _comments = new List<String>();
  var _textController = new TextEditingController();
  var _scrollController = new ScrollController();

  void _printMessage() {
    //print(message);
    Fluttertoast.showToast(msg: _message, backgroundColor: Colors.grey);
    setState(() {
      _postId += 1;
      _comments.add(_message);
      _textController.clear();
      _isChanged = false;
    });
  }

  @override
  void initState() {
    _postId = widget.postId;
    for (var i = 0; i < _postId; i++) {
      _comments.add("This is comment number $i");
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey[400], //Colors.black.withOpacity(0.5),
        ),
        margin: MediaQuery.of(context).padding,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            color: Colors.white,
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("123 Likes"),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[300],
                      ),
                      height: 50,
                      width: 50,
                      alignment: Alignment.center,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: Icon(
                          Icons.close,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  controller: _scrollController,
                  padding: EdgeInsets.zero,
                  //physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: _comments.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
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
                              decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Name ${widget.postId}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                      //"Comment number $index",
                                      _comments[index]),
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
                          controller: _textController,
                          onChanged: (val) {
                            setState(() {
                              _message = val;
                              if (val != '') {
                                _isChanged = true;
                              } else {
                                _isChanged = false;
                              }
                            });
                          },
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
        ),
      ),
    );
  }
}
