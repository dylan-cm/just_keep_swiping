import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Size size;
  final int level;

  Background({this.level, this.size});

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   width: size.width,
    //   height: size.height,
    //   decoration: BoxDecoration(
    //     image: DecorationImage(
    //       image: AssetImage(
    //         'assets/wet_grass_tile.png',
    //       ),
    //       // scale: 3.0,
    //       repeat: ImageRepeat.repeat,
    //       colorFilter: ColorFilter.mode(
    //         Colors.red.withOpacity(0.5), 
    //         BlendMode.color,
    //       ),
    //     ),
    //   ),
    // );
    return Image.asset(
      'assets/wet_grass_tile.png',
      scale: 3.0,
      width: size.width,
      height: size.height,
      repeat: ImageRepeat.repeat,
    );
    
    
  }
}