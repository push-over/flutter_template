import 'package:dio/dio.dart';
import 'package:flutter_template/common/config/config.dart';

/// Log 拦截器
class LogsInterceptors extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options) {
    if (GZConfig.DEBUG) {
      print('请求url：${options.path}');
      print('请求头: ' + options.headers.toString());
      if (options.data != null) {
        print('请求参数: ' + options.data.toString());
      }
    }
    return options;
  }

  @override
  onResponse(Response response) {
    if (GZConfig.DEBUG) {
      if (response != null) {
        print('返回参数: ' + response.toString());
      }
    }

    /// continue
    return response;
  }

  @override
  onError(DioError err) {
    if (GZConfig.DEBUG) {
      print('请求异常: ' + err.toString());
      print('请求异常信息: ' + err.response?.toString() ?? '');
    }
    return err;
  }
}
