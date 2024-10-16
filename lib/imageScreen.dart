import 'package:flutter/material.dart';


class Imagescreen extends StatefulWidget {
  const Imagescreen({super.key});

  @override
  State<Imagescreen> createState() => _ImagescreenState();
}

class _ImagescreenState extends State<Imagescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children:[
            Image.network('https://replicate.delivery/pbxt/JF3foGR90vm9BXSEXNaYkaeVKHYbJPinmpbMFvRtlDpH4MMk/out-0-1.png'),
            Positioned(
              right: 10,
              child: IconButton(onPressed: () {

              }, icon: Icon(Icons.share)),
            ),],
        ),
      ),
    );
  }
}
