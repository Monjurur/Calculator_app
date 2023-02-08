import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    ScreenUtil.init(context, designSize: const Size(360, 690));
    return Padding(
      padding:  const EdgeInsets.only(top: 5.0).w,
      child: Container(
        alignment: Alignment.center,
        height: 60.h,
        width: 35.w,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius:  BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
            bottomLeft: Radius.circular(30.r),
            bottomRight: Radius.circular(30.r),
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
                  style: TextStyle(color: textColor, fontSize: 10.sp),
                ),
              ),
            ),
            TextSpan(
                text: '$mainText',
                style: TextStyle(color: textColor, fontSize: 10.sp)),
            WidgetSpan(
              child: Transform.translate(
                offset: firstText == null ? const Offset(-1, -9) : const Offset(-1, 2),
                child: Text(
                  '${subText ?? ''}',
                  //superscript is usually smaller in size
                  textScaleFactor: 0.7,
                  style: TextStyle(color: textColor, fontSize: 10.sp),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
