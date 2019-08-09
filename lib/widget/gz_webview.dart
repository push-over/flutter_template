import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_template/common/redux/gz_state.dart';
import 'package:flutter_template/common/dao/user_dao.dart';
import 'package:flutter_template/common/utils/local_storage_utils.dart';
import 'package:flutter_template/common/config/config.dart';

class GZWebview extends StatefulWidget {
  final String url;
  final String title;
  final bool withZoom;
  final bool withLocalStorage;
  final bool withJavascript;
  final Store store;

  GZWebview(
      {Key key,
      @required this.url,
      @required this.title,
      this.store,
      this.withZoom = true,
      this.withLocalStorage = true,
      this.withJavascript = true})
      : super(key: key);

  @override
  _GZWebviewState createState() => _GZWebviewState();
}

class _GZWebviewState extends State<GZWebview> {
  FlutterWebviewPlugin _flutterWebviewPlugin = FlutterWebviewPlugin();

  @override
  void initState() {
    super.initState();

    _flutterWebviewPlugin.onUrlChanged.listen((String url) {
      if (url != null && url.isNotEmpty && url.contains('?code=')) {
        String code = url.split('?')[1].split('&')[0].split('=')[1];

        UserDao.GET_OAUTH2_TOKEN(code).then((res) async {
          if (res != null && res.result) {
            String token = res.data['access_token'];
            await LocalStorage.save(GZConfig.TOKEN_KEY, token);
            UserDao.GET_OPENAPI_USER(token, widget.store);
          }
        });
        Navigator.pop(context, 'refresh');
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _flutterWebviewPlugin.close();
  }

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<GZState>(
      builder: (BuildContext context, Store store) {
        return WebviewScaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          url: widget.url,
          withJavascript: widget.withJavascript,
          withLocalStorage: widget.withLocalStorage,
          withZoom: widget.withZoom,
          initialChild: Container(
            color: Colors.redAccent,
            child: const Center(
              child: Text('Waiting.....'),
            ),
          ),
        );
      },
    );
  }
}
