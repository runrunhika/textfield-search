import 'package:flutter/material.dart';

class SearchListExample extends StatefulWidget {
  @override
  _SearchListExampleState createState() => _SearchListExampleState();
}

class _SearchListExampleState extends State<SearchListExample> {
  Widget appBarTitle = Text(
    "食材を入力",
    style: TextStyle(color: Colors.white),
  );
  Icon icon = Icon(
    Icons.search,
    color: Colors.white,
  );
  final globalKey = GlobalKey<ScaffoldState>();
  final TextEditingController _controller = TextEditingController();
  List<dynamic> _list;
  bool _isSearching;
  String _searchText = "";
  List searchresult = List();

  _SearchListExampleState() {
    _controller.addListener(() {
      if (_controller.text.isEmpty) {
        setState(() {
          _isSearching = false;
          _searchText = "";
        });
      } else {
        setState(() {
          _isSearching = true;
          _searchText = _controller.text;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _isSearching = false;
    values();
  }

  void values() {
    _list = List();
    _list.add("tamago");
    _list.add("tamanegi");
    _list.add("ninzin");
    _list.add("daikon");
    _list.add("hourensou");
    _list.add("hakusai");
    _list.add("konnyaku");
    _list.add("minto");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: globalKey,
        appBar: buildAppBar(context),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Flexible(
                  child: searchresult.length != 0 || _controller.text.isNotEmpty
                      ? ListView.builder(
                          shrinkWrap: true,
                          itemCount: searchresult.length,
                          itemBuilder: (BuildContext context, int index) {
                            String listData = searchresult[index];
                            return Wrap(
                              direction: Axis.horizontal,
                              children: [
                                Chip(
                                  label: Text(listData.toString()),
                                ),
                              ],
                            );
                          },
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: _list.length,
                          itemBuilder: (BuildContext context, int index) {
                            String listData = _list[index];
                            return ListTile(
                              title: Text(listData.toString()),
                            );
                          },
                        ))
            ],
          ),
        ));
  }

  Widget buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      centerTitle: true, title: appBarTitle, actions: <Widget>[
      IconButton(
        icon: icon,
        onPressed: () {
          setState(() {
            if (this.icon.icon == Icons.search) {
              this.icon = Icon(
                Icons.close,
                color: Colors.white,
              );
              this.appBarTitle = TextField(
                controller: _controller,
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search, color: Colors.white),
                    hintText: "食材名...",
                    hintStyle: TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Colors.white),
                onChanged: searchOperation,
              );
              _handleSearchStart();
            } else {
              _handleSearchEnd();
            }
          });
        },
      ),
    ]);
  }

  void _handleSearchStart() {
    setState(() {
      _isSearching = true;
    });
  }

  void _handleSearchEnd() {
    setState(() {
      this.icon = Icon(
        Icons.search,
        color: Colors.white,
      );
      this.appBarTitle = Text(
        "",
        style: TextStyle(color: Colors.white),
      );
      _isSearching = false;
      _controller.clear();
    });
  }

  void searchOperation(String searchText) {
    searchresult.clear();
    if (_isSearching != null) {
      for (int i = 0; i < _list.length; i++) {
        String data = _list[i];
        if (data.toLowerCase().contains(searchText.toLowerCase())) {
          searchresult.add(data);
        }
      }
    }
  }
}
