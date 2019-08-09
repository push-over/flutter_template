import 'package:flutter/material.dart';
import 'package:flutter_template/common/dao/user_dao.dart';
import 'package:flutter_template/common/utils/local_storage_utils.dart';
import 'package:flutter_template/common/config/config.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_template/common/redux/gz_state.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return StoreBuilder<GZState>(
      builder: (BuildContext context, Store store) {
        return Center(
          child: Text('news'),
        );
      },
    );
  }
}
