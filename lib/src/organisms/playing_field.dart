import 'package:flutter/material.dart';
import '../molecules/score_display.dart';

class PlayingField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(0, 0),
      child: Stack(
        children: <Widget>[
          ScoreDisplay(),
        ],
      ),
    );
  }
}