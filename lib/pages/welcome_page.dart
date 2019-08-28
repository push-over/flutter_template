import 'dart:async';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_template/common/redux/gz_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_template/common/utils/navigator_utils.dart';
import 'package:flutter_template/common/network/address.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  bool hadInit = false;
  bool isLogin = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (hadInit) {
      return;
    }
    hadInit = true;

    ///防止多次进入
    Store<GZState> store = StoreProvider.of(context);
    new Future.delayed(const Duration(seconds: 2, milliseconds: 500), () {
      if (isLogin) {
        NavigatorUtils.goHome(context);
      } else {
        NavigatorUtils.goLogin(
          context,
          Address.OAUTH2_AUTHORIZE,
          '登陆开源社区',
          store,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Center(
              child: Text('请稍等...')
            ),
          ],
        ),
      ),
    );
  }
}
