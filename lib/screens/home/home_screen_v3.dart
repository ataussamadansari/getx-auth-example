import 'package:flutter/material.dart';

import 'home_desktop.dart';
import 'home_mobile.dart';
import 'home_tablet.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return const HomeMobile();
        } else if (constraints.maxWidth < 1100) {
          return const HomeTablet();
        } else {
          return const HomeDesktop();
        }
      },
    );
  }
}