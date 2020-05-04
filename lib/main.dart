import 'package:flutter/material.dart';

import 'features/presentation/pages/shop_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Himdeve Shop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ShopPage(),
    );
  }
}