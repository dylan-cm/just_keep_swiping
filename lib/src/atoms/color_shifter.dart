import 'package:flutter/material.dart';

class ColorShifter{
  final int level;
  Color color;
  BlendMode blendMode;
  List<BlendMode> blends = [
    BlendMode.multiply,
    BlendMode.saturation,
    BlendMode.color,
    BlendMode.colorDodge,
    BlendMode.difference,
    BlendMode.overlay,
  ];

  ColorShifter(this.level){
    int mod = (level-1)%7;
    if(level <= 1 ) color = Colors.black.withOpacity(0);
    else color = Color.fromRGBO(
      mod==1||mod==4||mod==6||mod==7 ? 255 : 0, 
      mod==2||mod==4||mod==5||mod==7 ? 255 : 0,
      mod==3||mod==5||mod==6||mod==7 ? 255 : 0, 
      (level-1)/3
      );
    blendMode = blends[level%blends.length];
  }
}