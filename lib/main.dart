import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_template/common/redux/gz_state.dart';
import 'package:flutter_template/common/constants/constants.dart';
import 'package:flutter_template/pages/bottom_navigation_bar.dart';
import 'package:flutter_template/pages/welcome_page.dart';

void main() => runApp(MyApp());

String WELCOME_PAGE = '/';
String HOME_PAGE = '/home';
String LOGIN_PAGE = '/login';
class MyApp extends StatelessWidget {
  final store = new Store<GZState>(
    appReducer,
    middleware: middleware,
    initialState: new GZState(
      themeData: new ThemeData(primarySwatch: GZColors.primarySwatch),
    ),
  );

  MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: new StoreBuilder<GZState>(
        builder: (BuildContext context, store) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: store.state.themeData,
            home: GridView(),
            routes: {
              WELCOME_PAGE: (BuildContext context) {
                return WelcomePage();
              },
              HOME_PAGE: (BuildContext context) {
                return GZBottomNavigationBar();
              },
            },
          );
        },
      ),
    );
  }
}
