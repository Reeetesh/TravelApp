import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'home.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset("animations/error.json", height: 300),
          ElevatedButton.icon(
            onPressed: () {
              // Respond to button press
              Get.to(()=>const HomePage());
            },
            icon: Icon(Icons.search, size: 18),
            label: Text("Search different location"),
          )
        ],
      ),
    ));
  }
}
