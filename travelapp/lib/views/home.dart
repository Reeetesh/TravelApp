// ignore_for_file: avoid_print, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';

import 'package:travelapp/api/fetch.dart';
import 'package:travelapp/controller/global_controller.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:travelapp/controller/list_controller.dart';
import 'package:travelapp/views/navbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);
  final ListController locationData = Get.put(ListController());

  late Animation<double> animation;
  late AnimationController animController;
  bool isForward = false;

  // FocusNode inputNode = FocusNode();

  @override
  void initState() {
    super.initState();
    animController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    final curvedAnimation =
        CurvedAnimation(parent: animController, curve: Curves.easeOut);

    animation = Tween<double>(begin: 0, end: 150).animate(curvedAnimation)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      body: Obx(() => globalController.checkLoading().isTrue
              ? Center(
                  child:
                      Lottie.asset("animations/animation2.json", height: 300),
                )
              : Stack(
                  children: [
                    Image.asset(
                      "assets/background.jpg",
                      height: double.infinity,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Center(
                      child: Container(
                        width: 220,
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: animation.value,
                              decoration: const BoxDecoration(
                                color: Colors.white54,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(50),
                                  bottomLeft: Radius.circular(50),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 20,
                                  bottom: 5,
                                ),
                                child: TextField(
                                  controller: globalController.controller,
                                  // focusNode: inputNode,
                                  // autofocus: true,
                                  cursorColor: Colors.white12,
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                  onSubmitted: (value) async {
                                    if (value != "") {
                                      print(globalController.controller.text);
                                      if (!isForward) {
                                        animController.forward();
                                        isForward = true;
                                      } else {
                                        await animController.reverse();
                                        isForward = false;
                                        Future.delayed(
                                            Duration(milliseconds: 4000));
                                        globalController.changeLoading();
                                        print(globalController.controller.text);
                                        await getPOI(globalController
                                                .controller.text
                                                .split(' ')[0])
                                            .then(
                                          (value) {
                                            locationData.locationData.value =
                                                value;
                                            globalController.changeLoading();
                                            Get.to(() => const NavBar());
                                          },
                                        );
                                      }
                                    } else {
                                      animController.reverse();
                                      isForward = false;
                                    }
                                  },
                                ),
                              ),
                            ),
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white54,
                                borderRadius: animation.value > 1
                                    ? const BorderRadius.only(
                                        topLeft: Radius.circular(0),
                                        bottomLeft: Radius.circular(0),
                                        bottomRight: Radius.circular(50),
                                        topRight: Radius.circular(50),
                                      )
                                    : BorderRadius.circular(50),
                              ),
                              child: IconButton(
                                icon: const Icon(
                                  Icons.search_sharp,
                                  color: Colors.black,
                                ),
                                onPressed: () async {
                                  if (!isForward) {
                                    animController.forward();
                                    isForward = true;
                                    // FocusScope.of(context)
                                    //     .requestFocus(inputNode);
                                  } else {
                                    if (globalController.controller.text !=
                                        "") {
                                      await animController.reverse();
                                      isForward = false;
                                      Future.delayed(
                                          Duration(milliseconds: 4000));
                                      globalController.changeLoading();
                                      print(globalController.controller.text);
                                      await getPOI(globalController
                                              .controller.text
                                              .split(' ')[0])
                                          .then(
                                        (value) {
                                          locationData.locationData.value =
                                              value;
                                          globalController.changeLoading();
                                          Get.to(() => const NavBar());
                                        },
                                      );
                                    } else {
                                      await animController.reverse();
                                      isForward = false;
                                    }
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
          // : Stack(
          //     children: [
          //       Image.asset(
          //         "assets/background.jpg",
          //         height: double.infinity,
          //         width: double.infinity,
          //         fit: BoxFit.cover,
          //       ),
          //       SafeArea(
          //         child: Center(
          //           child: Padding(
          //             padding: const EdgeInsets.symmetric(
          //                 vertical: 20, horizontal: 20),
          //             child: Column(
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               // ignore: prefer_const_literals_to_create_immutables
          //               children: [
          //                 const Text(
          //                   "Let's Explore",
          //                   style: TextStyle(
          //                       color: Colors.white,
          //                       fontSize: 30,
          //                       fontWeight: FontWeight.w500),
          //                 ),
          //                 const SizedBox(
          //                   height: 20,
          //                 ),
          //                 const Text(
          //                   "-A mind that is stretched by a new experience can never go back to its old dimensions.",
          //                   style: TextStyle(
          //                       color: Colors.white,
          //                       fontSize: 20,
          //                       fontWeight: FontWeight.w400),
          //                   textAlign: TextAlign.center,
          //                 ),
          //                 const SizedBox(
          //                   height: 25,
          //                 ),
          //                 TextField(
          //                   controller: globalController.controller,
          //                   keyboardType: TextInputType.text,
          //                   decoration: InputDecoration(
          //                       filled: true,
          //                       fillColor: Colors.white,
          //                       contentPadding: const EdgeInsets.symmetric(
          //                         horizontal: 15,
          //                         vertical: 15,
          //                       ),
          //                       hintText: "Enter your destination",
          //                       labelStyle: const TextStyle(
          //                         height: 4,
          //                         fontSize: 17,
          //                         color: Colors.black,
          //                         fontWeight: FontWeight.bold,
          //                       ),
          //                       enabledBorder: OutlineInputBorder(
          //                           borderRadius: BorderRadius.circular(10),
          //                           borderSide: const BorderSide(
          //                               width: 2, color: Colors.white)),
          //                       focusedBorder: OutlineInputBorder(
          //                           borderRadius: BorderRadius.circular(10),
          //                           borderSide: const BorderSide(
          //                               width: 3, color: Colors.white))),
          //                 ),
          //                 const SizedBox(
          //                   height: 20,
          //                 ),
          //                 FloatingActionButton(
          //                   backgroundColor: Colors.blue.shade300,
          //                   // When the user presses the button, show an alert dialog containing
          //                   // the text that the user has entered into the text field.
          //                   onPressed: () async {
          //                     globalController.changeLoading();
          //                     print(globalController.controller.text);
          //                     await getPOI(globalController.controller.text)
          //                         .then((value) {
          //                       locationData.locationData.value = value;
          //                       globalController.changeLoading();
          //                       Get.to(() => NavBar());
          //                       // print(locationData.locationData.value.food!.length);
          //                     });
          //                   },
          //                   tooltip: 'Show me the value!',
          //                   child: const Icon(Icons.airplanemode_active),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       )
          //     ],
          //   ),
          ),
    );
  }
}
