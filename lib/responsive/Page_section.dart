import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageSection extends StatefulWidget {
  final bool showAppHeader;
  final Widget? pageHeader;
  final Widget? leftSection;
  final Widget? rightSection;

  const PageSection(
      {Key? key,
        this.showAppHeader = true,
        this.pageHeader,
        this.leftSection,
        this.rightSection})
      : super(key: key);

  @override
  State<PageSection> createState() => _PageSectionState();
}

class _PageSectionState extends State<PageSection> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      //height: height,
     // width: width,
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        children: [
          SizedBox(
            //height: height,
            //width: width > 750 ? width * 0.66 : width,
            width: width > 750 ? width * 0.63 : width,
            child: SingleChildScrollView(
              child: widget.leftSection ?? const SizedBox(),
            ),
          ),
          SizedBox(
            //width: width > 750 ? width * 0.34 : width,
            width: width > 750 ? width * 0.37 : width,
           // height: height,
            child: SingleChildScrollView(child: widget.rightSection ?? const SizedBox()),
          ),
        ],
      ),
    );
  }
}