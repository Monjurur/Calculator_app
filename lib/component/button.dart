import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final IconData? icon;
  final String mainText;
  final String? firstText;
  final String? subText;
  final GestureTapCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double? elevation;

  const CustomElevatedButton({
    Key? key,
    this.icon,
    required this.onPressed,
    required this.mainText,
    this.textColor,
    this.backgroundColor,
    this.elevation,
    this.firstText,
    this.subText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Container(
        alignment: Alignment.center,
        height: 35,

        width: 50,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        child: RichText(
          text: TextSpan(children: [
            WidgetSpan(
              child: Transform.translate(
                offset: const Offset(1, -6),
                child: Text(
                  '${firstText ?? ''}',
                  textScaleFactor: 0.7,
                  style: TextStyle(color: textColor, fontSize: 18),
                ),
              ),
            ),
            TextSpan(
                text: '$mainText',
                style: TextStyle(color: textColor, fontSize: 18)),
            WidgetSpan(
              child: Transform.translate(
                offset: firstText == null ? Offset(-1, -9) : Offset(-1, 2),
                child: Text(
                  '${subText ?? ''}',
                  //superscript is usually smaller in size
                  textScaleFactor: 0.7,
                  style: TextStyle(color: textColor, fontSize: 18),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
