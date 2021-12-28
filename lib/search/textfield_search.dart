import 'package:flutter/material.dart';
import 'package:textfield_search/textfield_search.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController myController = TextEditingController();
  TextEditingController myController2 = TextEditingController();
  TextEditingController myController3 = TextEditingController();

  @override
  void initState() {
    super.initState();
    myController.addListener(_printLatestValue);
    myController2.addListener(_printLatestValue);
    myController3.addListener(_printLatestValue);
  }

  _printLatestValue() {
    print("text field: ${myController.text}");
    print("text field: ${myController2.text}");
    print("text field: ${myController3.text}");
  }

  @override
  void dispose() {
    myController.dispose();
    myController2.dispose();
    myController3.dispose();
    super.dispose();
  }

  Future<List> fetchSimpleData() async {
    await Future.delayed(Duration(milliseconds: 2000));
    List _list = List();
    _list.add('add' + '  1');
    _list.add('ADD' + ' 2');
    _list.add('eea' + 'dd3');
    _list.add('eea' + ' dd4');
    _list.add('eee' + ' add5d');
    _list.add('a' + ' d' + 'd6');
    return _list;
  }

  Future<List> fetchComplexData() async {
    await Future.delayed(Duration(milliseconds: 1000));
    List _list = List();
    List _jsonList = [
      {'label': 'add' + ' Item 1', 'value': 30},
      {'label': 'Add' + ' Item 2', 'value': 31},
      {'label': 'Tadd' + ' Item 3', 'value': 32},
    ];
    _list.add(TestItem.fromJson(_jsonList[0]));
    _list.add(TestItem.fromJson(_jsonList[1]));
    _list.add(TestItem.fromJson(_jsonList[2]));

    return _list;
  }

  final _testList = [
    'Item 1 a',
    'Item 2 a',
    'Item 3 a',
    'Item 4 a',
    'Item 1q',
    'Item 2q',
    'Item 1w',
    'Item 2w',
    'Item 3w',
    'Item 4w',
    'Item 1e',
    'Item 2e',
    'Item 1r',
    'Item 2r',
    'Item 3r',
    'Item 4r',
    'Item 1t',
    'Item 2t',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search　Screen"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          child: ListView(
            children: <Widget>[
              SizedBox(height: 16),
              TextFieldSearch(
                  label: 'Simple List',
                  minStringLength: 0,
                  controller: myController,
                  future: () {
                    return fetchSimpleData();
                  }),
              SizedBox(height: 16),
              TextFieldSearch(
                label: 'Complex List',
                controller: myController2,
                future: () {
                  return fetchComplexData();
                },
                getSelectedValue: (item) {
                  print(item);
                },
                minStringLength: 0,
                textStyle: TextStyle(color: Colors.red),
                decoration: InputDecoration(hintText: 'Search For Something'),
              ),
              SizedBox(height: 16),
              TextFieldSearch(
                  initialList: _testList,
                  label: 'List',
                  controller: myController3),
            ],
          ),
        ),
      ),
    );
  }
}

class TestItem {
  String label;
  dynamic value;

  TestItem({this.label, this.value});

  factory TestItem.fromJson(Map<String, dynamic> json) {
    return TestItem(label: json['label'], value: json['value']);
  }
}
