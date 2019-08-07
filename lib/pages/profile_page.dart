import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_template/common/redux/gz_state.dart';
import 'package:flutter_template/common/constants/constants.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Map<String, IconData> menus;

  @override
  void initState() {
    super.initState();

    menus = {
      '我的消息': GZIcons.MESSAGE,
      '阅读记录': GZIcons.RECORDING,
      '我的博客': GZIcons.BLOG,
      '我的问答': GZIcons.QUESTION_AND_ANSWER,
      '我的活动': GZIcons.ACTIVITY,
      '关注标签': GZIcons.TAG,
      '邀请好友': GZIcons.SHARE_LIGHT
    };
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return _buildHeader();
        }
        index -= 1;
        return ListTile(
          title: Text(
            menus.keys.elementAt(index),
            style: GZConstant.normalTextLight,
          ),
          leading: Icon(menus.values.elementAt(index)),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {},
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return index != 0 && index != menus.length ? Divider() : Container();
      },
      itemCount: menus.length + 1,
    );
  }

  Widget _buildHeader() {
    return StoreBuilder<GZState>(
      builder: (BuildContext context, Store store) {
        return Container(
          height: 150.0,
          color: store.state.themeData.primaryColor,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  child: Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Color(0xffffffff),
                        width: 2.0,
                      ),
                      image: DecorationImage(
                        image: NetworkImage(GZIcons.DEFAULT_REMOTE_PIC),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Praise',
                  style: GZConstant.normalTextWhite,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
