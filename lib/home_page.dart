import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_week4_assets/zoom_image.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(206, 0, 0, 0),
        appBar: AppBar(
            title: const Text('Dear Gallery ~'),
            titleTextStyle: const TextStyle(
                fontSize: 32, fontWeight: FontWeight.w800, color: Colors.black),
            centerTitle: true,
            backgroundColor: Colors.amber[300],
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32)),
            )),
        body: GridView.builder(
            padding: const EdgeInsets.all(18.0),
            itemCount: 30,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 12.0,
              crossAxisSpacing: 12.0,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(CupertinoPageRoute(
                      builder: (_) => const ZoomImage(
                            urlImage: "http://placekitten.com/200/300",
                          )));
                },
                child: Image.network(
                  "http://placekitten.com/200/300",
                  loadingBuilder: (context, widget, event) {
                    if (event == null) {
                      return widget;
                    } else {
                      return const SizedBox(
                        height: 1.0,
                        width: 1.0,
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                  errorBuilder: (context, object, error) {
                    return const Icon(Icons.error);
                  },
                ),
              );
            }));
  }
}
