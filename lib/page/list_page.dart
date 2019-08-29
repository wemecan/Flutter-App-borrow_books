import 'package:flutter/material.dart';
import 'package:borrow_books/util/util.dart';
import 'package:borrow_books/view/view.dart';
import 'package:borrow_books/kit/nav_back.dart';


class ListPage extends StatefulWidget {
  final String title;
  final String id;

  const ListPage({Key key, this.id,this.title}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  double navBarHeight = 44.0;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
        preferredSize: Size.fromHeight(navBarHeight),
        child: AppBar(
          title: Text(
            widget.title,
            style: TextStyle(
              color: Color(0xfffFFFFFF),
              fontSize: 17,
            ),
          ),
          
          elevation: 0, // 状态栏海拔
          brightness: Brightness.dark, // 状态栏样式
          leading: NavBackItem(
            color: Color(0xfffffffff),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        ),
        body: ListViewWidget(id: widget.id,),
      ),
    );
  }

  
}