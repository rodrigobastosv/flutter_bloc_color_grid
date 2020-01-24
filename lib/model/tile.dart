import 'package:flutter/material.dart';

class Tile {
  int index;
  Color color;

  Tile({@required this.index, @required this.color})
      : assert(index != null),
        assert(color != null);
}
