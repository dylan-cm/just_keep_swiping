import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../molecules/score_display.dart';
import '../molecules/high_score_display.dart';
import '../atoms/wind.dart';
import '../atoms/score_bloc.dart';
import '../atoms/bloc_provider.dart';

class PlayingField extends StatefulWidget {
  final int difficulty;
  final TickerProvider ticker;

  PlayingField({this.difficulty : 1, this.ticker});

  _PlayingFieldState createState() => _PlayingFieldState();
}

class _PlayingFieldState extends State<PlayingField>{

  Animation<double> scoreReducer;
  AnimationController scoreReducerController;

  double score;
  double highScore;
  bool falling;

  @override
  void initState() {
    score = 0.0;
    highScore = 0.0; //TODO: load highscore from db
    falling = false;
    
    scoreReducerController = AnimationController(
      duration: Duration(
        milliseconds: math.max( (1000 - widget.difficulty*20).round(), 50 ) 
      ),
      vsync: widget.ticker
    );
    scoreReducer = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: scoreReducerController,
        curve: Curves.linear
      )
    );

    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    final scoreBloc = BlocProvider.of<ScoreBloc>(context);
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onVerticalDragStart:(details) => _placeFinger(details),
      onVerticalDragUpdate: (details) => _onDrag(scoreBloc, details),
      onVerticalDragEnd: (details) => _liftFinger(details),
      child: Container(
        color: Colors.black,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: <Widget>[
            Image.asset(
              'assets/wet_grass_tile.png',
              scale: 3.0,
              width: size.width,
              height: size.height,
              repeat: ImageRepeat.repeat,
              ),
            AnimatedBuilder(
              animation: scoreReducer,
              builder: (conext, child){
                if (score <= 0.01) scoreBloc.setScore(0.0); //Don't wait for animation to end
                else scoreBloc.setScore(score);

                score *= scoreReducer.value;
                return ScoreDisplay(score, falling: falling,);
              }
            ),
            Wind(size, widget.ticker),
          ],
        ),
      ),
    );
  }

  void _liftFinger(DragEndDetails details) => _youLose();

  void _placeFinger(DragStartDetails details){
    setState(()=>falling=false);
    scoreReducerController.reset();
  }

  void _onDrag(ScoreBloc scoreBloc, DragUpdateDetails details){ //TODO: move logic into BLOC?
    scoreBloc.setScore(score);

    double punishment = score + details.delta.dy;
    double newScore = score + _applyDifficulty(details.delta.dy);
    if(newScore >= score) setState(() => score = newScore);
    else if(punishment >= 0) setState(()=> score = punishment);
    else setState(()=> score = 0);

    if(score > highScore) scoreBloc.setHighScore(widget.difficulty, score);
  }

  double _applyDifficulty(double dy){
    var power = 0.5 + widget.difficulty/100;
    double result = dy/(math.pow(score, power) + 1);
    return result;
  }

  void _youLose(){
    setState(()=>falling=true);
    scoreReducerController.forward();
    //TODO: Store highScore to db
  }
}