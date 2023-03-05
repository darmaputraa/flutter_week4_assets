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
        body: Center(
            child: CarouselSlider(items: [
          Image.network(widget.urlImage),
        ], options: CarouselOptions(height: 300, enlargeCenterPage: true))));
  }
}
