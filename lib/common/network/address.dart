import 'package:flutter_template/common/config/config.dart';

class Address {
  static const String HOST = 'https://www.oschina.net/';

  static const String OAUTH2_AUTHORIZE = '${HOST}action/oauth2/authorize?' +
      'response_type=${GZConfig.RESPONSE_TYPE}&' +
      'client_id=${GZConfig.CLIENT_ID}&' +
      'redirect_uri=${GZConfig.REDIRECT_URI}';

  static OAUTH2_TOKEN(String code) {
    return '${HOST}action/openapi/token?' +
        'client_id=${GZConfig.CLIENT_ID}&' +
        'client_secret=${GZConfig.CLIENT_SECRET}&' +
        'grant_type=${GZConfig.GRANT_TYPE}&' +
        'code=$code&' +
        'dataType=${GZConfig.DATA_TYPE}&' +
        'redirect_uri=${GZConfig.REDIRECT_URI}';
  }

  static OPENAPI_USER(String token) {
    return '${HOST}action/openapi/user?access_token=$token&dataType=${GZConfig.DATA_TYPE}';
  }
}
