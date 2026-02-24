import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Size: ${constraints.maxWidth.toInt()} x ${constraints.maxHeight.toInt()}",
            ),
            actions: constraints.maxWidth < 600
                ? null
                : [
                    TextButton(onPressed: () {}, child: Text('HOME')),
                    TextButton(onPressed: () {}, child: Text('PRICING')),
                    TextButton(onPressed: () {}, child: Text('ABOUT US')),
                    TextButton(onPressed: () {}, child: Text('CONTACT US')),
                  ],
          ),
          endDrawer: constraints.maxWidth >= 600
              ? null
              : Drawer(
                  child: ListView(
                    children: [
                      DrawerHeader(child: FlutterLogo(size: 100)),
                      ListTile(title: Text('HOME')),
                      ListTile(title: Text('PRICING')),
                      ListTile(title: Text('ABOUT US')),
                      ListTile(title: Text('CONTACT US')),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
