import 'package:flutter/material.dart';

class HighScoreDisplay extends StatelessWidget {
  final double highScore;

  HighScoreDisplay({@required this.highScore});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 35,
      child: Center(
        child: Text('High Score: ${(highScore*100).round()}',
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
    );
  }
}