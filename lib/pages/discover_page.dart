import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:redux/redux.dart';
import 'dart:async';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_template/common/redux/gz_state.dart';
import 'package:flutter_template/common/constants/constants.dart';
import 'package:flutter_template/common/utils/screenutil_utils.dart';
import 'package:flutter_template/common/utils/navigator_utils.dart';
import 'package:flutter_template/widget/gz_webview.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:flutter_template/pages/shake.dart';

class DiscoverPage extends StatelessWidget {
  List<Map<String, IconData>> blocks = [
    {
      '开源软件': GZIcons.SOFTWARE,
      '码云推荐': GZIcons.GITEE,
      '代码片段': GZIcons.CODE,
    },
    {
      '扫一扫': GZIcons.SCAN,
      '摇一摇': GZIcons.SHAKE,
    },
    {
      '码云封面人物': GZIcons.PEOPLE,
      // '线下活动': GZIcons.ACTIVITY_LINE,
    }
  ];

  Future scan() async {
    try {
      String barcode = await scanner.scan();
    } on PlatformException catch (e) {
      if (e.code == scanner.CameraAccessDenied) {
        print('The user did not grant the camera permission!');
      } else {
        print('Unknown error: $e');
      }
    } on FormatException {
      print(
          'null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
      print('Unknown error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<GZState>(
      builder: (BuildContext context, Store store) {
        return ListView.builder(
          itemCount: blocks.length,
          itemBuilder: (BuildContext context, int blockIndex) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: S.w(2),
                    color: Color(GZColors.line),
                  ),
                  bottom: BorderSide(
                    width: S.w(2),
                    color: Color(GZColors.line),
                  ),
                ),
              ),
              child: ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) => InkWell(
                  onTap: () {
                    switch (blocks[blockIndex].keys.elementAt(index)) {
                      case '开源软件':
                        NavigatorUtils.NavigatorRouter(
                          context,
                          GZWebview(
                            url: 'https://gitee.com/explore',
                            title: '开源软件',
                            store: store,
                          ),
                        );
                        break;
                      case '码云推荐':
                        NavigatorUtils.NavigatorRouter(
                          context,
                          GZWebview(
                            url: 'https://gitee.com/explore/recommend',
                            title: '码云推荐',
                            store: store,
                          ),
                        );
                        break;
                      case '代码片段':
                        NavigatorUtils.NavigatorRouter(
                          context,
                          GZWebview(
                            url: 'https://gitee.com/gists',
                            title: '代码片段',
                            store: store,
                          ),
                        );
                        break;
                      case '扫一扫':
                        scan();
                        break;
                      case '摇一摇':
                        NavigatorUtils.NavigatorRouter(context, ShakePage());
                        break;
                      case '码云封面人物':
                        NavigatorUtils.NavigatorRouter(
                          context,
                          GZWebview(
                            url: 'https://gitee.com/gitee-stars/',
                            title: '码云封面人物',
                            store: store,
                          ),
                        );
                        break;
                    }
                  },
                  child: ListTile(
                    title: Text(blocks[blockIndex].keys.elementAt(index)),
                    leading: Icon(blocks[blockIndex].values.elementAt(index)),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
                separatorBuilder: (BuildContext context, int index) => Divider(
                  height: S.h(1),
                  color: Color(GZColors.line),
                ),
                itemCount: blocks[blockIndex].length,
              ),
            );
          },
        );
      },
    );
  }
}
