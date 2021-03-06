import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_template/common/event/http_error_event.dart';
import 'package:flutter_template/common/event/event.dart';
import 'package:flutter_template/common/network/code.dart';
import 'package:flutter_template/widget/gz_drawer.dart';
import 'package:flutter_template/common/constants/constants.dart';

import 'package:flutter_template/pages/news_page.dart';
import 'package:flutter_template/pages/discover_page.dart';
import 'package:flutter_template/pages/tweet_page.dart';
import 'package:flutter_template/pages/profile_page.dart';
import 'package:flutter_template/pages/publish_tweet.dart';
import 'package:flutter_template/common/utils/navigator_utils.dart';

class GZBottomNavigationBar extends StatefulWidget {
  @override
  _GZBottomNavigationBarState createState() => _GZBottomNavigationBarState();
}

class _GZBottomNavigationBarState extends State<GZBottomNavigationBar> {
  StreamSubscription stream;
  int _currentIndex = 0;
  PageController _pageController = PageController(initialPage: 0);
  List<Widget> _pages;
  List<Map<String, dynamic>> _navigationBar;

  @override
  void initState() {
    super.initState();

    _navigationBar = [
      {
        'title': '资讯',
        'icon': GZIcons.NEWS,
        'activeIcon': GZIcons.NEWS_FILL,
      },
      {
        'title': '动弹',
        'icon': GZIcons.TWEET,
        'activeIcon': GZIcons.TWEET_FILL,
      },
      {
        'title': '发现',
        'icon': GZIcons.DISCOVER,
        'activeIcon': GZIcons.DISCOVER_FILL,
      },
      {
        'title': '我的',
        'icon': GZIcons.PROFILE,
        'activeIcon': GZIcons.PROFILE_FILL,
      }
    ];

    _pages = [
      NewsPage(),
      TweetPage(),
      DiscoverPage(),
      ProfilePage(),
    ];

    stream = eventBus.on<HttpErrorEvent>().listen((event) {
      errorHandleFunction(event.code, event.message);
    });
  }

  @override
  void dispose() {
    super.dispose();
    if (stream != null) {
      stream.cancel();
      stream = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(_navigationBar[_currentIndex]['title']),
        elevation: 0.0,
      ),
      drawer: GZDrawer(),
      floatingActionButton: _currentIndex == 1 ? FloatingActionButton(
        onPressed: () {
          NavigatorUtils.NavigatorRouter(
            context,
            PublishTweetPage(),
          );
        },
        child: Icon(Icons.add),
      ) : null,
      body: PageView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) => _pages[index],
        itemCount: _pages.length,
        controller: _pageController,
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        if (mounted) {
          setState(() {
            _currentIndex = index;
            _pageController.animateToPage(
              index,
              duration: Duration(microseconds: 1),
              curve: Curves.ease,
            );
          });
        }
      },
      items: _navigationBar
          .map(
            (item) => BottomNavigationBarItem(
              title: Text(item['title']),
              icon: Icon(item['icon']),
              activeIcon: Icon(item['activeIcon']),
            ),
          )
          .toList(),
    );
  }

  /// 网络错误提醒
  errorHandleFunction(int code, message) {
    switch (code) {
      case Code.NETWORK_ERROR:
        Fluttertoast.showToast(msg: '网络错误');
        break;
      case 401:
        Fluttertoast.showToast(msg: '[401错误可能: 未授权 \\ 授权登录失败 \\ 登录过期]');
        break;
      case 403:
        Fluttertoast.showToast(msg: '403权限错误');
        break;
      case 404:
        Fluttertoast.showToast(msg: '404错误');
        break;
      case Code.NETWORK_TIMEOUT:
        Fluttertoast.showToast(msg: '请求超时');
        break;
      default:
        Fluttertoast.showToast(msg: '其他异常' + " " + message);
        break;
    }
  }
}
