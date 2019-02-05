import 'package:flutter/material.dart';
import '../organisms/playing_field.dart';
import '../atoms/bloc_provider.dart';
import '../atoms/score_bloc.dart';
import '../organisms/hud.dart';

class Game extends StatefulWidget {
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> 
  with TickerProviderStateMixin{

  final scoreBloc = ScoreBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: scoreBloc,
      child: StreamBuilder(
        stream: scoreBloc.scoreStream,
        initialData: 0.0,
        builder: (context, AsyncSnapshot<double> snapshot) => PageView.builder(
          physics: snapshot.data==0.0 ? BouncingScrollPhysics() : NeverScrollableScrollPhysics() ,
          itemCount: 100,
          itemBuilder: (context, index){
            return _buildLevel(index+1);
          },
        )
      )
    );
  }

  Widget _buildLevel(int level){
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          PlayingField(
            ticker: this,
            difficulty: level
          ),
          Hud(level: level),
        ],
      ),
    );
  }
}