import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ZoomImage extends StatefulWidget {
  final String urlImage;

  const ZoomImage({Key? key, required this.urlImage}) : super(key: key);

  @override
  State<ZoomImage> createState() => _ZoomImageState();
}

class _ZoomImageState extends State<ZoomImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(206, 0, 0, 0),
        appBar: AppBar(
            title: const Text('Detail Image Gallery ~'),
            titleTextStyle: const TextStyle(
                fontSize: 32, fontWeight: FontWeight.w800, color: Colors.black),
            centerTitle: true,
            backgroundColor: Colors.amber[300],
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32)),
            )),
        body: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CarouselSlider(
                    items: [
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            Image.network(widget.urlImage),
                            const SizedBox(height: 20),
                            Text(
                              widget.urlImage.toString(),
                              style: const TextStyle(color: Colors.amber),
                            )
                          ],
                        ),
                      ),
                    ],
                    options: CarouselOptions(
                        height: 400,
                        autoPlay: true,
                        autoPlayCurve: Curves.decelerate,
                        viewportFraction: 0.6,
                        enlargeCenterPage: true)),
              ],
            ),
          ),
        ));
  }
}
