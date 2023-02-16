import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:travelapp/controller/list_controller.dart';

class FeedPage extends StatelessWidget {
  FeedPage({super.key});
  ListController locationData = Get.find();
  @override
  Widget build(BuildContext context) {
    print(locationData.locationData.value.food!.length);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background3.jpg"), fit: BoxFit.cover)),
        child: Container(
            padding: const EdgeInsets.all(10.0),
            child: GridView.builder(
              itemCount: locationData.locationData.value.food!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  crossAxisSpacing: 2.0,
                  mainAxisSpacing: 1.0),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    child: Column(
                  children: [
                    ClipRRect(
                      // ignore: sort_child_properties_last

                      child: Image.network(locationData
                          .locationData.value.poi![index].fotoUrl
                          .toString()),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      locationData.locationData.value.poi![index].title
                          .toString(),
                      style: TextStyle(
                          color: Colors.black26,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    )
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
