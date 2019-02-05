import 'package:flutter/material.dart';
import 'dart:math' as math;

class ScoreDisplay extends StatelessWidget {
  final double score;
  final double stride;
  final double size;
  final bool falling;

  ScoreDisplay(this.score, {this.stride : 4, this.size : 80, this.falling : false});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 100 + score,
      child: Center(
        child:
         Column(
          children: <Widget>[
            Text('${(score*100).round()}',
              style: TextStyle(
                fontSize: math.max(score/8, 16), 
                color: Colors.white
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: math.min(size/2 + score/10, size),
              height: math.min(size/2 + score/10, size),
              child: buildMan(score, stride),  
            )
          ],
        )
      ),
    );
  }

  Widget buildMan(double distance, double stride){
    if (falling) return Image.asset('assets/falling.png');
    else if( (distance%stride) > (stride/2) ) return Image.asset('assets/run_left.png');
    else return Image.asset('assets/run_right.png');
  }
}