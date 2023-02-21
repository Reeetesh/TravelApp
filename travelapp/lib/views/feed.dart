import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:travelapp/controller/list_controller.dart';
import 'package:travelapp/views/error.dart';

class FeedPage extends StatelessWidget {
  FeedPage({super.key});
  ListController locationData = Get.find();
  @override
  Widget build(BuildContext context) {
    print(locationData.locationData.value.food!.length);
    return locationData.locationData.value.poi!.isEmpty
        ? const ErrorPage()
        : Scaffold(
            body: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/background3.jpg"),
                      fit: BoxFit.cover)),
              child: Container(
                  padding: const EdgeInsets.all(10.0),
                  child: GridView.builder(
                    itemCount: locationData.locationData.value.food!.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            crossAxisSpacing: 2.0,
                            mainAxisSpacing: 1.0),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5, right: 5),
                            child: ClipRRect(
                              // ignore: sort_child_properties_last
                              child: Image.network(
                                locationData
                                    .locationData.value.poi![index].fotoUrl
                                    .toString(),
                                width: double.infinity,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            locationData.locationData.value.poi![index].title
                                .toString()
                                .split(". ")[1],
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ));
                      // Image.network(
                      //     locationData.locationData.value.poi![index].fotoUrl ?? "");
                    },
                  )),
            ),
          );
  }
}
