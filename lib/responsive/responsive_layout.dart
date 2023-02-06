import 'package:flutter/cupertino.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget portrait;
  final Widget landscape;

   const ResponsiveLayout(
      {Key? key, required this.portrait,required this.landscape})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Orientation currentOrientation = MediaQuery.of(context).orientation;
    if(currentOrientation == Orientation.portrait){
      return portrait ;
    } else {
      return landscape ;
    }
  }
}
