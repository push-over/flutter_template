import 'package:redux/redux.dart';

import 'package:flutter_template/common/config/config.dart';
import 'package:flutter_template/common/dao/dao_result.dart';
import 'package:flutter_template/common/network/address.dart';
import 'package:flutter_template/common/network/request.dart';
import 'package:flutter_template/common/redux/user_redux.dart';

import 'package:flutter_template/common/models/User.dart';

class UserDao {
  static GET_OAUTH2_TOKEN(String code) async {
    var res = await httpManager.netFetch(
        Address.OAUTH2_TOKEN(code), null, null, null);

    if (res != null) {
      if (GZConfig.DEBUG) {
        print(res.data.toString());
      }
      return DataResult(res.data, res.result);
    }
  }

  static GET_OPENAPI_USER(String token, Store store) async {
    var res = await httpManager.netFetch(
        Address.OPENAPI_USER(token), null, null, null);
    if (res != null) {
      if (GZConfig.DEBUG) {
        print(res.data.toString());
      }
      User userinfo = User.fromJson(res.data);
      store.dispatch(new UpdateUserAction(userinfo));
    }
  }
}
