import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MyMessagePage extends StatefulWidget {
  @override
  _MyMessagePageState createState() => _MyMessagePageState();
}

class _MyMessagePageState extends State<MyMessagePage> {
  List<String> _tabTitles = ['@我', '评论', '私信'];
  int curPage = 1;
  List messageList;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabTitles.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('消息中心'),
          elevation: 0.0,
          bottom: TabBar(
            tabs: _tabTitles
                .map((title) => Tab(
                      text: title,
                    ))
                .toList(),
          ),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        body: TabBarView(children: [
          Center(
            child: Text('暂无内容'),
          ),
          Center(
            child: Text('暂无内容'),
          ),
          Center(
            child: Text('暂无内容'),
          ),
        ]),
      ),
    );
  }
}
