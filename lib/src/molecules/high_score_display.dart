import 'package:flutter/material.dart';

class HighScoreDisplay extends StatelessWidget {
  final double highScore;

  HighScoreDisplay({@required this.highScore});

  @override
  Widget build(BuildContext context) {
    return Text('High Score \n ${(highScore*100).round()}',
      style: TextStyle(
        color: Colors.white, 
        fontSize: Theme.of(context).textTheme.title.fontSize,
      ),
      textAlign: TextAlign.center,
    );
  }
}