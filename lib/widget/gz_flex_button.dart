import 'package:flutter/material.dart';

class GZFlexButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final VoidCallback onPress;
  final double fontSize;
  final int maxLines;
  final MainAxisAlignment mainAxisAlignment;

  GZFlexButton(
      {Key key,
      @required this.text,
      this.color,
      this.textColor,
      @required this.onPress,
      this.fontSize = 20.0,
      this.mainAxisAlignment = MainAxisAlignment.center,
      this.maxLines = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      padding: const EdgeInsets.only(
        left: 20.0,
        top: 10.0,
        right: 20.0,
        bottom: 10.0,
      ),
      textColor: textColor,
      color: color,
      child: Flex(
        mainAxisAlignment: mainAxisAlignment,
        direction: Axis.horizontal,
        children: <Widget>[
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: fontSize),
              textAlign: TextAlign.center,
              maxLines: maxLines,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
      onPressed: () {
        this.onPress?.call();
      },
    );
  }
}
