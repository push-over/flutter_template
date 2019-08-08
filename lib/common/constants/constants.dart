import 'package:flutter/material.dart';
import 'package:flutter_template/common/config/config.dart';

abstract class GZColors {
  static const int primaryValue = 0xFF24292E;
  static const int primaryLightValue = 0xFF42464b;
  static const int primaryDarkValue = 0xFF121917;

  static const int line = 0xFFAAAAAA;

  static const MaterialColor primarySwatch = const MaterialColor(
    primaryValue,
    const <int, Color>{
      50: const Color(primaryLightValue),
      100: const Color(primaryLightValue),
      200: const Color(primaryLightValue),
      300: const Color(primaryLightValue),
      400: const Color(primaryLightValue),
      500: const Color(primaryValue),
      600: const Color(primaryDarkValue),
      700: const Color(primaryDarkValue),
      800: const Color(primaryDarkValue),
      900: const Color(primaryDarkValue),
    },
  );

  static const int textWhite = 0xFFFFFFFF;
  static const int miWhite = 0xFFECECEC;
  static const int white = 0xFFFFFFFF;
  static const int actionBlue = 0xFF267AFF;
  static const int subTextColor = 0xFF959595;
  static const int subLightTextColor = 0xFFC4C4C4;

  static const int mainBackgroundColor = miWhite;

  static const int mainTextColor = primaryDarkValue;
  static const int textColorWhite = white;
}

abstract class GZIcons {
  static const String DEFAULT_REMOTE_PIC =
      'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1700741544,1951185347&fm=26&gp=0.jpg';

  /// BottomNavigationBar
  static const IconData NEWS =
      IconData(0xe7c5, fontFamily: GZConfig.FONT_FAMILY);
  static const IconData NEWS_FILL =
      IconData(0xe7c4, fontFamily: GZConfig.FONT_FAMILY);
  static const IconData TWEET =
      IconData(0xe7d7, fontFamily: GZConfig.FONT_FAMILY);
  static const IconData TWEET_FILL =
      IconData(0xe7d8, fontFamily: GZConfig.FONT_FAMILY);
  static const IconData DISCOVER =
      IconData(0xe67e, fontFamily: GZConfig.FONT_FAMILY);
  static const IconData DISCOVER_FILL =
      IconData(0xe6ba, fontFamily: GZConfig.FONT_FAMILY);
  static const IconData PROFILE =
      IconData(0xe7d5, fontFamily: GZConfig.FONT_FAMILY);
  static const IconData PROFILE_FILL =
      IconData(0xe7d9, fontFamily: GZConfig.FONT_FAMILY);

  /// ProfilePage
  static const IconData MESSAGE =
      IconData(0xe7e0, fontFamily: GZConfig.FONT_FAMILY);
  static const IconData RECORDING =
      IconData(0xe971, fontFamily: GZConfig.FONT_FAMILY);
  static const IconData BLOG =
      IconData(0xe8de, fontFamily: GZConfig.FONT_FAMILY);
  static const IconData QUESTION_AND_ANSWER =
      IconData(0xe893, fontFamily: GZConfig.FONT_FAMILY);
  static const IconData ACTIVITY =
      IconData(0xe6c5, fontFamily: GZConfig.FONT_FAMILY);
  static const IconData TAG =
      IconData(0xe752, fontFamily: GZConfig.FONT_FAMILY);
  static const IconData SHARE_LIGHT =
      IconData(0xe7e1, fontFamily: GZConfig.FONT_FAMILY);

  /// DiscoverPage
  static const IconData SOFTWARE =
      IconData(0xe6ce, fontFamily: GZConfig.FONT_FAMILY);
  static const IconData GITEE =
      IconData(0xe601, fontFamily: GZConfig.FONT_FAMILY);
  static const IconData CODE =
      IconData(0xe846, fontFamily: GZConfig.FONT_FAMILY);
  static const IconData SCAN =
      IconData(0xe7db, fontFamily: GZConfig.FONT_FAMILY);
  static const IconData SHAKE =
      IconData(0xe608, fontFamily: GZConfig.FONT_FAMILY);
  static const IconData PEOPLE =
      IconData(0xe651, fontFamily: GZConfig.FONT_FAMILY);
  static const IconData ACTIVITY_LINE =
      IconData(0xe691, fontFamily: GZConfig.FONT_FAMILY);
}

abstract class GZConstant {
  static const double lagerTextSize = 30.0;
  static const double bigTextSize = 23.0;
  static const double normalTextSize = 18.0;
  static const double middleTextWhiteSize = 16.0;
  static const double smallTextSize = 14.0;
  static const double minTextSize = 12.0;

  static const minText = TextStyle(
    color: Color(GZColors.subLightTextColor),
    fontSize: minTextSize,
  );

  static const smallTextWhite = TextStyle(
    color: Color(GZColors.textColorWhite),
    fontSize: smallTextSize,
  );

  static const smallText = TextStyle(
    color: Color(GZColors.mainTextColor),
    fontSize: smallTextSize,
  );

  static const smallTextBold = TextStyle(
    color: Color(GZColors.mainTextColor),
    fontSize: smallTextSize,
    fontWeight: FontWeight.bold,
  );

  static const smallSubLightText = TextStyle(
    color: Color(GZColors.subLightTextColor),
    fontSize: smallTextSize,
  );

  static const smallActionLightText = TextStyle(
    color: Color(GZColors.actionBlue),
    fontSize: smallTextSize,
  );

  static const smallMiLightText = TextStyle(
    color: Color(GZColors.miWhite),
    fontSize: smallTextSize,
  );

  static const smallSubText = TextStyle(
    color: Color(GZColors.subTextColor),
    fontSize: smallTextSize,
  );

  static const middleText = TextStyle(
    color: Color(GZColors.mainTextColor),
    fontSize: middleTextWhiteSize,
  );

  static const middleTextWhite = TextStyle(
    color: Color(GZColors.textColorWhite),
    fontSize: middleTextWhiteSize,
  );

  static const middleSubText = TextStyle(
    color: Color(GZColors.subTextColor),
    fontSize: middleTextWhiteSize,
  );

  static const middleSubLightText = TextStyle(
    color: Color(GZColors.subLightTextColor),
    fontSize: middleTextWhiteSize,
  );

  static const middleTextBold = TextStyle(
    color: Color(GZColors.mainTextColor),
    fontSize: middleTextWhiteSize,
    fontWeight: FontWeight.bold,
  );

  static const middleTextWhiteBold = TextStyle(
    color: Color(GZColors.textColorWhite),
    fontSize: middleTextWhiteSize,
    fontWeight: FontWeight.bold,
  );

  static const middleSubTextBold = TextStyle(
    color: Color(GZColors.subTextColor),
    fontSize: middleTextWhiteSize,
    fontWeight: FontWeight.bold,
  );

  static const normalText = TextStyle(
    color: Color(GZColors.mainTextColor),
    fontSize: normalTextSize,
  );

  static const normalTextBold = TextStyle(
    color: Color(GZColors.mainTextColor),
    fontSize: normalTextSize,
    fontWeight: FontWeight.bold,
  );

  static const normalSubText = TextStyle(
    color: Color(GZColors.subTextColor),
    fontSize: normalTextSize,
  );

  static const normalTextWhite = TextStyle(
    color: Color(GZColors.textColorWhite),
    fontSize: normalTextSize,
  );

  static const normalTextMitWhiteBold = TextStyle(
    color: Color(GZColors.miWhite),
    fontSize: normalTextSize,
    fontWeight: FontWeight.bold,
  );

  static const normalTextActionWhiteBold = TextStyle(
    color: Color(GZColors.actionBlue),
    fontSize: normalTextSize,
    fontWeight: FontWeight.bold,
  );

  static const normalTextLight = TextStyle(
    color: Color(GZColors.primaryLightValue),
    fontSize: normalTextSize,
  );

  static const largeText = TextStyle(
    color: Color(GZColors.mainTextColor),
    fontSize: bigTextSize,
  );

  static const largeTextBold = TextStyle(
    color: Color(GZColors.mainTextColor),
    fontSize: bigTextSize,
    fontWeight: FontWeight.bold,
  );

  static const largeTextWhite = TextStyle(
    color: Color(GZColors.textColorWhite),
    fontSize: bigTextSize,
  );

  static const largeTextWhiteBold = TextStyle(
    color: Color(GZColors.textColorWhite),
    fontSize: bigTextSize,
    fontWeight: FontWeight.bold,
  );

  static const largeLargeTextWhite = TextStyle(
    color: Color(GZColors.textColorWhite),
    fontSize: lagerTextSize,
    fontWeight: FontWeight.bold,
  );

  static const largeLargeText = TextStyle(
    color: Color(GZColors.primaryValue),
    fontSize: lagerTextSize,
    fontWeight: FontWeight.bold,
  );
}
