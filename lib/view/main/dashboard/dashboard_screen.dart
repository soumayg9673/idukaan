import 'package:flutter/material.dart';
import 'package:idukaan/view/util/margins.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});
  static String id = '/idukaan/hello';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: screenMargin(context),
          child: const Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
