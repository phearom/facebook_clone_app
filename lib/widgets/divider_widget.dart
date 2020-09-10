import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Container(
      height: 2,
      color: isDark ? Colors.grey[600].withOpacity(0.5) : Colors.grey[300],
    );
  }
}