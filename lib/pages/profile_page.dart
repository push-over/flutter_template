import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_template/common/redux/gz_state.dart';
import 'package:flutter_template/common/constants/constants.dart';
import 'package:flutter_template/common/utils/screenutil_utils.dart';
import 'package:flutter_template/common/utils/navigator_utils.dart';
import 'package:flutter_template/pages/profile_message.dart';
import 'package:flutter_template/pages/profile_detail.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Map<String, IconData> menus;
  String name;
  String avatar;

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
          onTap: () {
            switch (menus.keys.elementAt(index)) {
              case '我的消息':
                NavigatorUtils.NavigatorRouter(context, MyMessagePage());
                break;
              default:
            }
          },
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
          height: S.h(300),
          color: store.state.themeData.primaryColor,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  child: store.state.userInfo != null
                      ? Container(
                          width: S.w(120),
                          height: S.w(120),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Color(0xffffffff),
                              width: S.w(4),
                            ),
                            image: DecorationImage(
                              image: NetworkImage(store.state.userInfo.avatar),
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      : Image.asset(
                          'static/images/ic_avatar_default.png',
                          width: S.w(120),
                          height: S.h(120),
                        ),
//                  onTap: () => NavigatorUtils.goLogin(
//                    context,
//                    Address.OAUTH2_AUTHORIZE,
//                    '登陆开源社区',
//                    store,
//                  ),
                  onTap: () {
                    NavigatorUtils.NavigatorRouter(
                      context,
                      ProfileDetailPage(),
                    );
                  },
                ),
                SizedBox(
                  height: S.h(20),
                ),
                Text(
                  store.state.userInfo != null
                      ? store.state.userInfo.name
                      : '点击头像登录',
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
