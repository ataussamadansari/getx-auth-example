import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_auth_example/controllers/counter_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Center(
        child: GetBuilder<CounterController>(
          builder: (c) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Value: ${c.count}", style: Theme.of(context).textTheme.titleLarge),
                ElevatedButton(
                  onPressed: () {
                    c.increment();
                  },
                  child: Text("Increment"),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
