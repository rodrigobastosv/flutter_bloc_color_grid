import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc_color_grid/model/tile.dart';

class GridHelper {
  Tile generateTile(int length) {
    final rColor = _generateRandomNumber();
    final gColor = _generateRandomNumber();
    final bColor = _generateRandomNumber();
    final opacity = 1.0;
    final randomColor = Color.fromRGBO(rColor, gColor, bColor, opacity);
    final listLength = length;

    return Tile(
        index: listLength,
        color: randomColor,
        rColor: rColor,
        gColor: gColor,
        bColor: bColor,
        opacity: opacity);
  }

  int _generateRandomNumber() {
    Random random = Random();
    return random.nextInt(255);
  }
}
