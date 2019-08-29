import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:borrow_books/util/util.dart';
import 'package:borrow_books/view/view.dart';

class ListViewWidget extends StatefulWidget {

  final String id;

  const ListViewWidget({Key key, this.id}) : super(key: key);

  @override
  _ListViewWidgetState createState() => _ListViewWidgetState();
}

class _ListViewWidgetState extends State<ListViewWidget> {
  List items = [];
  bool onLoading = true;

  @override
  void initState() {
    super.initState();
    HudUtil.show();
    _initData();
  }

  /// 拉数据
  void _initData() async {
    Future<String> loadString =
        DefaultAssetBundle.of(context).loadString("data/home_list.json");
    loadString.then((String value) {
      Map<String, dynamic> obc = json.decode(value);
      setState(
        () {
          items = obc[widget.id];
          print('数据：$items');
        },
      );
    });

    Future.delayed(Duration(milliseconds: 1000), () {
      setState(() {
        onLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return onLoading
        ? Container()
        : Container(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ItemCellWidget(item: items[(index)]);
              },
            ),
          );
  }
}
