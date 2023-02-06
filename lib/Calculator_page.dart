import 'package:calculator_app/Pages/portrait_page.dart';
import 'package:calculator_app/responsive/responsive_layout.dart';
import 'package:flutter/material.dart';

import 'Pages/landscape_page.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      landscape: LandscapePage(),
      portrait: PortraitPage(),
    );
  }
}
