import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Rawdata.dart';
import 'VideoPlayerScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Webkul Tv App')),
      body: SingleChildScrollView(child: sampleVideoGrid(),),
    );
  }

  Widget sampleVideoGrid() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(), // Prevents nested scroll issues
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: images.length,
        itemBuilder: (context, index) {
          String url = images[index];
          String url1 = links[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => VideoPlayerScreen(url: url1),
                ),
              );
            },
            child: Image.network(
              url,
              height: 150,
              width: 150,
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
