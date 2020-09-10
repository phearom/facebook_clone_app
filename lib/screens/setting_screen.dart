import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Setting"),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: Text("Setting Panel"),
            ),
          ),
          Expanded(
            flex: 3,
            child: ListView.builder(
              itemCount: 15,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.account_balance),
                      title: Text("ListTile Setting"),
                      trailing: Icon(Icons.arrow_forward),
                      onTap: () {},
                    ),
                    Divider(
                      color: Colors.blue,
                      height: 0,
                    ),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
