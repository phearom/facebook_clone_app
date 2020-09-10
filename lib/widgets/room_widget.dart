import 'package:flutter/material.dart';

class RoomWidget extends StatelessWidget {
  final int roomId;

  const RoomWidget({Key key, this.roomId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
      child: Container(
        child: roomId == 0
            ? Container(
                alignment: Alignment.center,
                width: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  //color: Colors.red,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Icon(
                          Icons.video_call,
                          color: Colors.blue,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Create Room",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Stack(
                children: [
                  Container(
                    height: 60,
                    width: 50,
                    child: CircleAvatar(
                      backgroundImage: ExactAssetImage('assets/image/man.png'),
                    ),
                  ),
                  Positioned(
                    bottom: 0.0,
                    right: 0.0,
                    child: Container(
                      height: 10.0,
                      width: 10.0,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
