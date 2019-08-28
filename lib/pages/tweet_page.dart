import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_template/common/redux/gz_state.dart';
import 'package:flutter_template/widget/tweet_list_item.dart';
import 'package:flutter_template/common/dao/tweet_dao.dart';
import 'package:flutter_template/common/utils/local_storage_utils.dart';
import 'package:flutter_template/common/config/config.dart';
import 'package:flutter_template/common/models/TweetList.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_easyrefresh/material_footer.dart';

class TweetPage extends StatefulWidget {
  @override
  _TweetPageState createState() => _TweetPageState();
}

class _TweetPageState extends State<TweetPage>
    with SingleTickerProviderStateMixin {
  List _tabTitles = ['最新', '热门'];
  bool init = false;
  var _tweetList;
  int curPage = 1;
  TabController _tabController;
  EasyRefreshController _controller;
  ScrollController _scrollController;
  bool isLogin = false;

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();
    _scrollController = ScrollController();
    _tabController = TabController(length: _tabTitles.length, vsync: this)
      ..addListener(() {
        switch (_tabController.index) {
          case 0:
            _getTweetList(false, 0);
            break;
          case 1:
            _getTweetList(false, -1);
            break;
        }
      });
  }

  _getTweetList(bool isLoadMore, var user) async {
    String token = await LocalStorage.get(GZConfig.TOKEN_KEY);
    if (token != null) {
      TweetDao.GET_TWEET_LIST(token, curPage, user).then((res) async {
        if (res != null && res.result) {
          var tweetList = TweetList.fromJson(res.data);
          if (mounted) {
            setState(() {
              if (isLoadMore) {
                _tweetList.addAll(tweetList.tweetlist);
              } else {
                _tweetList = tweetList.tweetlist;
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

    _getTweetList(false, 0);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<GZState>(
      builder: (BuildContext context, Store store) {
        return Column(
          children: <Widget>[
            Container(
              color: store.state.themeData.primaryColor,
              child: TabBar(
                controller: _tabController,
                indicatorColor: Color(0xffffffff),
                labelColor: Color(0xffffffff),
                tabs: _tabTitles.map((title) {
                  return Tab(
                    text: title,
                  );
                }).toList(),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                // children: [_buildLatestTweetList(), _buildHotTweetList()],
                children: <Widget>[
                  _buildLatestTweetList(),
                  _buildHotTweetList(),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildLatestTweetList() {
    return _tweetList != null
        ? EasyRefresh(
            controller: _controller,
            header: MaterialHeader(),
            footer: MaterialFooter(),
            child: ListView.separated(
              controller: _scrollController,
              itemCount: _tweetList.length,
              itemBuilder: (BuildContext context, int index) {
                return TweetListItem(tweetData: _tweetList[index]);
              },
              separatorBuilder: (context, index) {
                return Container(
                  height: 10.0,
                  color: Colors.grey[200],
                );
              },
            ),
            onRefresh: () async {
              await _getTweetList(false, 0);
            },
            onLoad: () async {
              if (mounted) {
                setState(() {
                  curPage++;
                });
              }
              await _getTweetList(true, 0);
            },
          )
        : Center(
            child: CupertinoActivityIndicator(),
          );
  }

  Widget _buildHotTweetList() {
    if (_tweetList == null) {
      return Center(
        child: CupertinoActivityIndicator(),
      );
    }

    return ListView.separated(
      itemBuilder: (context, index) {
        if (index == _tweetList.length) {
          return Container(
            padding: const EdgeInsets.all(10.0),
            color: Color(0xaaaaaaaa),
            child: Center(
              child: Text('没有更多数据了'),
            ),
          );
        }
        return TweetListItem(tweetData: _tweetList[index]);
      },
      separatorBuilder: (context, index) {
        return Container(
          height: 10.0,
          color: Color(0xaaaaaaaa),
        );
      },
      itemCount: _tweetList.length + 1,
    );
  }
}
