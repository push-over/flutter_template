import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_template/common/redux/theme_redux.dart';

/// 全局 Redux store 的对象， 保存 State 数据
class GZState {
  /// 主题
  ThemeData themeData;

  GZState({this.themeData});
}

/// 创建 Reducer
GZState appReducer(GZState state, action) {
  return GZState(

    /// 通过自定义 ThemeDataReducer 将 GZState 内的 themeData 和 action 关联在一起
    themeData: ThemeDataReducer(state.themeData, action),
  );
}

final List<Middleware<GZState>> middleware = [];
