import 'package:flutter/material.dart';
import '../organisms/playing_field.dart';

class Game extends StatefulWidget {
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> 
  with TickerProviderStateMixin{

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: 100,
      itemBuilder: (context, index){
        return _buildLevel(index);
      },
    );
  }

  Widget _buildLevel(int difficulty){
    return Scaffold(
       body: PlayingField(
         ticker: this,
         difficulty: difficulty
       ),
    );
  }
}