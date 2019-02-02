import 'package:flutter/material.dart';

class PlayingField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(0, 0),
      child: Stack(
        children: <Widget>[
          Positioned(
            child: Text('200'),
          )
        ],
      ),
    );
  }
}