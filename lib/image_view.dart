import 'package:flutter/material.dart';

class ImageView extends StatefulWidget{
  ImageView({super.key, required this.images});
  final String images;

  @override
  State<ImageView> createState() => _ImageView();
}

class _ImageView extends State<ImageView>
{

  double scale = 1.0;

  void _updateSize() {
    setState(() {
      scale = scale == 1.0 ? 2.0 : 1.0;
    });
  }

  //fullscreen dan zoom 2x image dengan menggunakan AnimatedScale
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: (){
          _updateSize();
        },
        child: AnimatedScale(
          scale: scale,
          duration: const Duration(seconds: 1),
          child: Image.asset(widget.images),
        ),
      ),
    );
  }
}
