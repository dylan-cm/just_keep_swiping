import 'package:flutter/material.dart';
import '../organisms/playing_field.dart';

class Game extends StatefulWidget {
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: PlayingField(),
    );
  }
}