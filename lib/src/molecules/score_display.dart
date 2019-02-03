import 'package:flutter/material.dart';

class ScoreDisplay extends StatelessWidget {
  final double score;

  ScoreDisplay(this.score);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 100 + score,
      child: Center(
        child: Text('${(score*100).round()}',
          style: TextStyle(fontSize: 44),
        ),
      ),
    );
  }
}