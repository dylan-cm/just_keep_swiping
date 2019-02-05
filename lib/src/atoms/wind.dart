import 'package:flutter/material.dart';
import 'color_shifter.dart';

class Wind extends StatefulWidget {
  final Size size;
  final TickerProvider ticker;
  final int level;

  Wind(this.size, this.ticker, this.level);
  _WindState createState() => _WindState();
}

class _WindState extends State<Wind>{

  Animation<double> windAnimation;
  AnimationController windController;

  List<String> windAssets;

  void initState() { 
    windAssets = [
      'assets/wind1.png',
      'assets/wind4.png',
      'assets/wind5.png',
      'assets/wind2.png',
      'assets/wind3.png',
      'assets/wind6.png',
    ];

    windController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: widget.ticker
    );

    windAnimation = Tween(begin: -0.4, end: 5.4).animate(
      CurvedAnimation(
        parent: windController,
        curve: Curves.linear
      )
    );
    windController.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Opacity(
        opacity: .5,
        child: AnimatedBuilder(
          animation: windAnimation,
          builder: (context, child){
            return Image.asset(
              windAssets[windAnimation.value.round()],
              scale: 3.0,
              repeat: ImageRepeat.repeatX,
              width: widget.size.width,
              alignment: Alignment.bottomCenter,
              //color: ColorShifter(widget.level-2).color,
              //colorBlendMode: ColorShifter(widget.level-3).blendMode,
              // color: Colors.transparent,
              );
          },
        )
      )
    );
  }
}