import 'package:flutter/material.dart';

class SizeRoute extends PageRouteBuilder {
  final Widget widget;

  SizeRoute({this.widget})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              widget,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              Align(
                child: SizeTransition(
                  sizeFactor: animation,
                  child: child,
                ),
              ),
        );
}
