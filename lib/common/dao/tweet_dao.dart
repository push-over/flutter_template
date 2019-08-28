import 'package:flutter_template/common/config/config.dart';
import 'package:flutter_template/common/dao/dao_result.dart';
import 'package:flutter_template/common/network/address.dart';
import 'package:flutter_template/common/network/request.dart';

class TweetDao {
  static GET_TWEET_LIST(String token, int curPage, var user) async {
    var res =
    await httpManager.netFetch(Address.TWEET_LIST(token, curPage, user), null, null, null);
    if (res != null) {
      if (GZConfig.DEBUG) {
        print(res.data.toString());
      }

      return DataResult(res.data, res.result);
    }
  }
}
