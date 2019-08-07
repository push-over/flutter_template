import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

final ThemeDataReducer = combineReducers<ThemeData>([
  /// 将 Action, 处理Action动作的方法， State绑定
  TypedReducer<ThemeData, RefreshThemeDataAction>(_refresh),
]);

/// 定义处理 Action 行为的方法， 返回新的 State
ThemeData _refresh(ThemeData themeData, action) {
  themeData = action.themeData;
  return themeData;
}

/// Action 类  将该 Action 在 Reducer 中与处理 Action 的方法绑定
class RefreshThemeDataAction {
  final ThemeData themeData;

  RefreshThemeDataAction({this.themeData});
}
