import 'package:flutter/material.dart';
import 'package:mapbox_mapas/screens/screens.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        body: FullScreenMapScreen(),
      ),
    );
  }
}
