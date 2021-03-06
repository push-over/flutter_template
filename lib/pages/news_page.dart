import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_template/common/constants/constants.dart';
import 'package:flutter_template/common/dao/news_dao.dart';
import 'package:flutter_template/common/utils/local_storage_utils.dart';
import 'package:flutter_template/common/utils/screenutil_utils.dart';
import 'package:flutter_template/common/config/config.dart';
import 'package:flutter_template/common/models/NewsList.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_easyrefresh/material_footer.dart';

import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_template/common/redux/gz_state.dart';
import 'package:flutter_template/common/utils/navigator_utils.dart';
import 'package:flutter_template/widget/gz_webview.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  EasyRefreshController _controller;
  ScrollController _scrollController;

  var _newsList;
  bool init = false;
  int curPage = 1;

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();
    _scrollController = ScrollController();
  }

  _getNewsList(bool isLoadMore) async {
    String token = await LocalStorage.get(GZConfig.TOKEN_KEY);
    if (token != null) {
      NewsDao.GET_NEWS_LIST(token, curPage).then((res) async {
        if (res != null && res.result) {
          var newsList = NewsList.fromJson(res.data);
          if (mounted) {
            setState(() {
              if (isLoadMore) {
                _newsList.addAll(newsList.newslist);
              } else {
                _newsList = newsList.newslist;
              }
            });
          }
        }
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (init) return;

    if (mounted) {
      setState(() {
        init = true;
      });
    }

    _getNewsList(false);
  }

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<GZState>(
      builder: (BuildContext context, Store store) {
        return _newsList != null
            ? EasyRefresh(
                controller: _controller,
                header: MaterialHeader(),
                footer: MaterialFooter(),
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: _newsList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _buildNewsListItem(index, store);
                  },
                ),
                onRefresh: () async {
                  await _getNewsList(false);
                },
                onLoad: () async {
                  if (mounted) {
                    setState(() {
                      curPage++;
                    });
                  }
                  await _getNewsList(true);
                },
              )
            : Center(
                child: CupertinoActivityIndicator(),
              );
      },
    );
  }

  Widget _buildNewsListItem(int index, Store store) {
    return InkWell(
      onTap: () {
        NavigatorUtils.NavigatorRouter(
          context,
          GZWebview(
              url: 'https://www.oschina.net/news/${_newsList[index].id}',
              title: _newsList[index].title,
              store: store),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(left: 20.0),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color(GZColors.line),
              width: S.w(2),
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                _newsList[index].title,
                style: TextStyle(
                  fontSize: S.sp(40),
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: S.h(20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '@${_newsList[index].author} ${_newsList[index].pubDate.toString().split(' ')[0]}',
                    style: TextStyle(
                      color: Color(0xaaaaaaaa),
                      fontSize: S.sp(28),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        GZIcons.MESSAGE,
                        color: Color(0xaaaaaaaa),
                      ),
                      Text(
                        '${_newsList[index].commentCount}',
                        style: TextStyle(
                          color: Color(0xaaaaaaaa),
                          fontSize: S.sp(26),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
