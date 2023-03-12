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
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 12.0,
              crossAxisSpacing: 12.0,
              mainAxisExtent: 200.0,
            ),
            itemCount: 12,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(CupertinoPageRoute(
                      builder: (_) => ZoomImage(
                            urlImage: 'https://picsum.photos/id/$index/200/300',
                          )));
                },
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.network(
                          "https://picsum.photos/id/$index/200/300",
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
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}
