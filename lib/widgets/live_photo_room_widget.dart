import 'package:flutter/material.dart';

class LivePhotoRoomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: FlatButton.icon(
              onPressed: () => print('live'),
              icon: Icon(
                Icons.live_tv,
                color: Colors.red,
              ),
              label: Text("Live"),
            ),
          ),
          Expanded(
            child: FlatButton.icon(
              onPressed: () => print('photo'),
              icon: Icon(
                Icons.photo,
                color: Colors.green,
              ),
              label: Text("Photo"),
            ),
          ),
          Expanded(
            child: FlatButton.icon(
              onPressed: () => print('room'),
              icon: Icon(
                Icons.room,
                color: Colors.red,
              ),
              label: Text("Room"),
            ),
          ),
        ],
      ),
    );
  }
}
