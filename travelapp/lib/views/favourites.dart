import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/list_controller.dart';

class Favourites extends StatefulWidget {
  const Favourites({super.key});

  @override
  State<Favourites> createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  final CarouselController _carouselController = CarouselController();

  int _currentIndex = 0;

  ListController locationData = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Image.network(
              locationData.locationData.value.poi![_currentIndex].fotoUrl!,
              height: 500,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            // Positioned(
            //     top: 80,
            //     child: Expanded(
            //       child: Text(
            //         locationData.locationData.value.poi![_currentIndex].title!
            //             .split('. ')[1],
            //         softWrap: false,
            //         overflow: TextOverflow.ellipsis,
            //         maxLines: 2,
            //         textAlign: TextAlign.center,
            //         style: TextStyle(
            //           fontSize: 64,
            //           color: Colors.white,
            //         ),
            //       ),
            //     )),
            Positioned(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.grey.shade100.withOpacity(1),
                      Colors.grey.shade100.withOpacity(1),
                      Colors.grey.shade100.withOpacity(1),
                      Colors.grey.shade100.withOpacity(1),
                      Colors.grey.shade50.withOpacity(0),
                      Colors.grey.shade100.withOpacity(0),
                      Colors.grey.shade100.withOpacity(0),
                      Colors.grey.shade100.withOpacity(0),
                    ],
                  ),
                ),
              ),
            ),
            Container(
                padding: const EdgeInsets.only(top: 400),
                // bottom: 50,
                height: MediaQuery.of(context).size.height * 0.9,
                width: double.infinity,
                child: CarouselSlider(
                  carouselController: _carouselController,
                  options: CarouselOptions(
                      height: 500.0,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.70,
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      }),
                  items: locationData.locationData.value.poi!.map((move) {
                    return Builder(
                      builder: ((BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(30)),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    _detailCard(context);
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Stack(
                                      children: [
                                        ColorFiltered(
                                          colorFilter: ColorFilter.mode(
                                            Colors.grey.shade400,
                                            BlendMode.modulate,
                                          ),
                                          child: Image.network(
                                            move.fotoUrl!,
                                            fit: BoxFit.cover,
                                            height: 380,
                                          ),
                                        ),
                                        Expanded(
                                          // bottom: 30,
                                          // left: 10,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 335, left: 10),
                                            child: Text(
                                              move.title!.split('. ')[1],
                                              softWrap: false,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    );
                  }).toList(),
                ))
          ],
        ),
      ),
    );
  }

  void _detailCard(context) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        enableDrag: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(15), topLeft: Radius.circular(15)),
        ),
        context: context,
        builder: (BuildContext context) {
          return Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Colors.grey.shade900,
                  Colors.grey.shade100,
                ])),
            height: MediaQuery.of(context).size.height * 0.65,
            clipBehavior: Clip.none,
            child: Stack(
              alignment: AlignmentDirectional.topCenter,
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: -30,
                  child: Container(
                    width: 23,
                    height: 23,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color.fromARGB(255, 240, 229, 229)
                          .withOpacity(0.5),
                    ),
                    child: GestureDetector(
                      child: const Icon(
                        Icons.close_rounded,
                        size: 23,
                        color: Color.fromARGB(255, 51, 51, 51),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15),
                                ),
                                child: Image.network(
                                  locationData.locationData.value
                                      .poi![_currentIndex].fotoUrl!,
                                  fit: BoxFit.fill,
                                  width: 411,
                                  height: 300,
                                ),
                              ),
                            ],
                          ),
                          // TITLE
                          Padding(
                            padding: const EdgeInsets.only(left: 7, right: 7),
                            child: Container(
                              alignment: Alignment.topLeft,
                              padding: const EdgeInsets.only(left: 6),
                              child: Text(
                                  locationData.locationData.value
                                      .poi![_currentIndex].title!,
                                  // overflow: TextOverflow.visible,
                                  maxLines: 2,
                                  softWrap: false,
                                  style: GoogleFonts.montserrat(
                                    textStyle: const TextStyle(
                                      height: 1.8,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 22,
                                    ),
                                  )),
                            ),
                          ),
                          // DESC
                          Padding(
                            padding: const EdgeInsets.only(left: 7, right: 7),
                            child: Container(
                              alignment: Alignment.topLeft,
                              padding: const EdgeInsets.only(left: 6),
                              child: Text(
                                  locationData.locationData.value
                                      .poi![_currentIndex].desc!
                                      .substring(1),
                                  style: GoogleFonts.montserrat(
                                    textStyle: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                    ),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
