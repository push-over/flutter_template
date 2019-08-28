import 'package:flutter/material.dart';
import 'package:flutter_template/common/models/UserInfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_template/common/utils/local_storage_utils.dart';
import 'package:flutter_template/common/config/config.dart';
import 'package:dio/dio.dart';

class ProfileDetailPage extends StatefulWidget {
  @override
  _ProfileDetailPageState createState() => _ProfileDetailPageState();
}

class _ProfileDetailPageState extends State<ProfileDetailPage> {
  UserInfo _userInfo;

  _getMyInformation() async {
    String token = await LocalStorage.get(GZConfig.TOKEN_KEY);
    if (token != null) {
      Dio dio = new Dio();
      var response = await dio.get(
          'https://www.oschina.net/action/openapi/my_information?access_token=$token&dataType=json');
      if (mounted) {
        setState(() {
          _userInfo = UserInfo.fromJson(response.data);
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _getMyInformation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          '我的资料',
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: buildSingleChildScrollView(),
    );
  }

  Widget buildSingleChildScrollView() {
    return SingleChildScrollView(
      child: _userInfo == null
          ? Center(
              child: CupertinoActivityIndicator(),
            )
          : Column(
              children: <Widget>[
                InkWell(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.only(
                      left: 20.0,
                    ),
                    padding: const EdgeInsets.only(
                      top: 10.0,
                      bottom: 10.0,
                      right: 20.0,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '头像',
                          style: TextStyle(fontSize: 20.0),
                        ),
                        Container(
                          width: 60.0,
                          height: 60.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 2.0,
                            ),
                            image: DecorationImage(
                              image: NetworkImage(_userInfo.portrait),
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Divider(),
                InkWell(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.only(left: 20.0),
                    padding: const EdgeInsets.only(
                        top: 10.0, bottom: 10.0, right: 20.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '昵称',
                          style: TextStyle(fontSize: 20.0),
                        ),
                        Text(
                          _userInfo.name,
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(),
                Container(
                  margin: const EdgeInsets.only(left: 20.0),
                  padding: const EdgeInsets.only(
                      top: 10.0, bottom: 10.0, right: 20.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '加入时间',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      Text(
                        _userInfo.joinTime,
                        // _userInfo.joinTime.split(' ')[0],
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ],
                  ),
                ),
                Divider(),
                InkWell(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.only(left: 20.0),
                    padding: const EdgeInsets.only(
                        top: 10.0, bottom: 10.0, right: 20.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '所在地区',
                          style: TextStyle(fontSize: 20.0),
                        ),
                        Text(
                          _userInfo.province,
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(),
                InkWell(
                  onTap: () {
                    //TODO
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 20.0),
                    padding: const EdgeInsets.only(
                        top: 10.0, bottom: 10.0, right: 20.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Text(
                            '开发平台',
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            // 'Android,C/C++,J2ME/K-Java,Python,.NET/C#',
                            _userInfo.platforms.toString(),
                            style: TextStyle(fontSize: 20.0),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(),
                InkWell(
                  onTap: () {
                    //TODO
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 20.0),
                    padding: const EdgeInsets.only(
                        top: 10.0, bottom: 10.0, right: 20.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Text(
                            '专长领域',
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            // '手机软件开发，服务器开发，软件开发管理',
                            _userInfo.expertise.toString(),
                            style: TextStyle(fontSize: 20.0),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(),
                Container(
                  margin: const EdgeInsets.only(left: 20.0),
                  padding: const EdgeInsets.only(
                      top: 10.0, bottom: 10.0, right: 20.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '粉丝数',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      Text(
                        _userInfo.fansCount.toString(),
                        style: TextStyle(fontSize: 20.0),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Divider(),
                Container(
                  margin: const EdgeInsets.only(left: 20.0),
                  padding: const EdgeInsets.only(
                      top: 10.0, bottom: 10.0, right: 20.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '收藏数',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      Text(
                        _userInfo.favoriteCount.toString(),
                        style: TextStyle(fontSize: 20.0),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Divider(),
                Container(
                  margin: const EdgeInsets.only(left: 20.0),
                  padding: const EdgeInsets.only(
                      top: 10.0, bottom: 10.0, right: 20.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '关注数',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      Text(
                        _userInfo.followersCount.toString(),
                        style: TextStyle(fontSize: 20.0),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Divider(),
              ],
            ),
    );
  }
}
