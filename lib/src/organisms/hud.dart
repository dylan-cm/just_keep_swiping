import 'package:flutter/material.dart';
import '../atoms/score_bloc.dart';
import '../atoms/bloc_provider.dart';
import '../molecules/high_score_display.dart';

class Hud extends StatelessWidget {
  final int level;

  Hud({this.level});

  @override
  Widget build(BuildContext context) {
    final scoreBloc = BlocProvider.of<ScoreBloc>(context);

    return StreamBuilder(
      stream: scoreBloc.highScoreStream,
      initialData: Map<int, double>.from({level : 0.0}),
      builder: (context, AsyncSnapshot<Map<int, double>>snapshot){
        return Container(height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children : <Widget>[
              HighScoreDisplay( highScore: snapshot.data[level] ),
              Text('Level \n$level',
                style: TextStyle(
                  color: Colors.white, 
                  fontSize: Theme.of(context).textTheme.title.fontSize,
                ),
                textAlign: TextAlign.center,
              ),
            ]
          ),
        );
      },
    );
  }
}