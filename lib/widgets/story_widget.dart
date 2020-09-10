import 'package:flutter/material.dart';

class StroryWidget extends StatelessWidget {
  final int storyId;

  const StroryWidget({Key key, this.storyId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
      child: storyId == 0
          ? Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'assets/image/man.png',
                    fit: BoxFit.cover,
                    width: 120,
                    height: 180,
                  ),
                ),
                Positioned(
                  top: 8.0,
                  left: 8.0,
                  child: Container(
                    alignment: Alignment.center,
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      "+",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 50.0,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Add Your Story",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            )
          : Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'assets/image/man.png',
                    fit: BoxFit.cover,
                    width: 120,
                    height: 180,
                  ),
                ),
                Positioned(
                  top: 8.0,
                  left: 8.0,
                  child: Container(
                    alignment: Alignment.center,
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.blue,
                        width: 2,
                      ),
                    ),
                    child: CircleAvatar(
                      backgroundImage: ExactAssetImage('assets/image/man.png'),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0.0,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Name $storyId",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
    );
  }
}