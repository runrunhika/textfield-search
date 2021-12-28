// EXAMPLE use case for TextFieldSearch Widget
import 'package:flutter/material.dart';
import 'package:textfield_search_sample/search/textfield_search.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Search TextField',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

