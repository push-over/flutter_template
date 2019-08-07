import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_template/common/redux/gz_state.dart';
import 'package:flutter_template/common/constants/constants.dart';
import 'package:flutter_template/common/utils/utils.dart';

class GZDrawer extends StatelessWidget {
  showThemeDialog(BuildContext context, Store store) {
    List<String> list = [];
    List<Color> colorList = Utils.getThemeListColor();
    for (var i = 0; i < colorList.length; i++) {
      i == 0 ? list.add('默认主题') : list.add('主题 $i');
    }

    Utils.showCommitOptionDialog(context, list, (index) {
      Utils.pushTheme(store, index);
    }, colorList: colorList);
  }

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<GZState>(
      builder: (BuildContext context, Store store) {
        return Drawer(
          child: Container(
            color: store.state.themeData.primaryColor,
            child: SingleChildScrollView(
              child: Container(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height,
                ),
                child: Material(
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      UserAccountsDrawerHeader(
                        decoration: BoxDecoration(
                          color: store.state.themeData.primaryColor,
                        ),
                        accountName: Text(
                          'praise',
                          style: GZConstant.largeTextWhite,
                        ),
                        accountEmail: Text(
                          'push_over@163.com',
                          style: GZConstant.normalTextLight,
                        ),
                        currentAccountPicture: GestureDetector(
                          onTap: () {},
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                              GZIcons.DEFAULT_REMOTE_PIC,
                            ),
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text(
                          '切换主题',
                          style: GZConstant.normalText,
                        ),
                        onTap: () => showThemeDialog(context, store),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
