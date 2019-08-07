import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class S {
  static double w(double width) => ScreenUtil.getInstance().setWidth(width);

  static double h(double height) => ScreenUtil.getInstance().setHeight(height);

  static double sp(double fontSize) => ScreenUtil.getInstance().setSp(fontSize);
}
