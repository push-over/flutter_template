import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/widget/gz_webview.dart';
import 'package:redux/redux.dart';

abstract class NavigatorUtils {
  /// 替换
  static pushReplacementNamed(BuildContext context, String routeName) {
    Navigator.pushReplacementNamed(context, routeName);
  }

  /// 切换无参数页面
  static pushNamed(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  /// 公共打开方式
  static NavigatorRouter(BuildContext context, Widget widget) {
    return Navigator.push(context,
        new CupertinoPageRoute(builder: (context) => pageContainer(widget)));
  }

  /// webview登录
  static goLogin(BuildContext context, String url, String title, Store store) {
    String _url = url.replaceAll('\t', '');
    NavigatorRouter(context, GZWebview(url: _url, title: title, store: store)).then((res){
      goHome(context);
    });
  }

  static goHome(BuildContext context) {
    return Navigator.pushReplacementNamed(context, '/home');
  }

  /// Page页面的容器，做一次通用自定义
  static Widget pageContainer(widget) {
    return MediaQuery(
      /// 不受系统字体缩放影响
      data: MediaQueryData.fromWindow(WidgetsBinding.instance.window)
          .copyWith(textScaleFactor: 1),
      child: widget,
    );
  }

  /// 弹出 dialog
  static Future<T> showGZDialog<T>({
    @required BuildContext context,
    bool barrierDismissible = true,
    WidgetBuilder builder,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return pageContainer(SafeArea(
          child: builder(context),
        ));
      },
    );
  }
}
