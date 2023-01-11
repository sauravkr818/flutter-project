import 'package:flutter/material.dart';
import 'package:application/pages/index.dart';

const primary = Color(0xff645dd7);

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        appBarTheme: const AppBarTheme(
      color: Color(0xff645dd7),
    )),
    home: const IndexPage(),
  ));
}
