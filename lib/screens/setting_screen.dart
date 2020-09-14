import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Menu"),
                  IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () {},
                    icon: Icon(Icons.search),
                  )
                ],
              ),
            ),
            Text("Phearom Neang"),
            Text("Memories"),
            Container(
              child: GridView.count(
                physics: NeverScrollableScrollPhysics(), //inside singlechildscrollview disable it. let singlechildscrollview do it.
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                shrinkWrap: true,
                crossAxisCount: 2,
                childAspectRatio: 2,
                children: List.generate(
                  12,
                  (index) => Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text("${index + 1}"),
                    ),
                  ),
                ),
              ),
            ),
            ExpansionTile(
              tilePadding: EdgeInsets.zero,
              childrenPadding: EdgeInsets.zero,
              title: Text(
                'Help & Support',
              ),
              children: <Widget>[
                ListTile(
                  title: Text('data 1'),
                ),
                ListTile(
                  title: Text('data 2'),
                ),
                ListTile(
                  title: Text('data 3'),
                )
              ],
            ),
            ExpansionTile(
              tilePadding: EdgeInsets.zero,
              childrenPadding: EdgeInsets.zero,
              title: Text(
                'Setting & Privacy',
              ),
              children: <Widget>[
                ListTile(
                  title: Text('data 1'),
                ),
                ListTile(
                  title: Text('data 2'),
                ),
                ListTile(
                  title: Text('data 3'),
                )
              ],
            ),
            Container(
              child: Text("Logout"),
            )
          ],
        ),
      ),
    );
  }
}
