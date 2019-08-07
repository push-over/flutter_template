import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_template/common/constants/constants.dart';
import 'package:flutter_template/common/redux/theme_redux.dart';
import 'package:flutter_template/common/utils/navigator_utils.dart';
import 'package:flutter_template/widget/gz_flex_button.dart';

abstract class Utils {
  static getThemeData(Color color) {
    return ThemeData(primarySwatch: color, platform: TargetPlatform.android);
  }

  static List<Color> getThemeListColor() {
    return [
      GZColors.primarySwatch,
      Colors.brown,
      Colors.blue,
      Colors.teal,
      Colors.amber,
      Colors.blueGrey,
      Colors.deepOrange,
    ];
  }

  static pushTheme(Store store, int index) {
    ThemeData themeData;
    List<Color> colors = getThemeListColor();
    themeData = getThemeData(colors[index]);
    store.dispatch(RefreshThemeDataAction(themeData: themeData));
  }

  static Future<Null> showCommitOptionDialog(
    BuildContext context,
    List<String> commitMaps,
    ValueChanged<int> onTap, {
    width = 250.0,
    height = 300.0,
    List<Color> colorList,
  }) {
    return NavigatorUtils.showGZDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Container(
            width: width,
            height: height,
            padding: new EdgeInsets.all(4.0),
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(4.0),
              ),
            ),
            child: ListView.builder(
              itemCount: commitMaps.length,
              itemBuilder: (context, index) {
                return GZFlexButton(
                  mainAxisAlignment: MainAxisAlignment.start,
                  fontSize: 14.0,
                  color: colorList != null
                      ? colorList[index]
                      : Theme.of(context).primaryColor,
                  text: commitMaps[index],
                  textColor: Colors.white,
                  onPress: () {
                    Navigator.pop(context);
                    onTap(index);
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
