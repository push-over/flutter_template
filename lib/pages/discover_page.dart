import 'package:flutter/material.dart';
import 'package:flutter_template/common/constants/constants.dart';
import 'package:flutter_template/common/utils/screenutil_utils.dart';

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
      '线下活动': GZIcons.ACTIVITY_LINE,
    }
  ];

  @override
  Widget build(BuildContext context) {
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
                  onTap: () {},
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
  }
}
