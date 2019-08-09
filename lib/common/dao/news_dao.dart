import 'package:flutter_template/common/config/config.dart';
import 'package:flutter_template/common/dao/dao_result.dart';
import 'package:flutter_template/common/network/address.dart';
import 'package:flutter_template/common/network/request.dart';

class NewsDao {
  static GET_NEWS_LIST(String token, int curPage) async {
    var res =
        await httpManager.netFetch(Address.NEWS_LIST(token, curPage), null, null, null);
    if (res != null) {
      if (GZConfig.DEBUG) {
        print(res.data.toString());
      }

      return DataResult(res.data, res.result);
    }
  }
}
