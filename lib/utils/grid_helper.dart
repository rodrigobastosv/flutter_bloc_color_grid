import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc_color_grid/model/tile.dart';

class GridHelper {
  Tile generateTile(int length) {
    final randomColor = Color.fromRGBO(_generateRandomNumber(),
        _generateRandomNumber(), _generateRandomNumber(), 1.0);
    final listLength = length;

    return Tile(
      index: listLength,
      color: randomColor,
    );
  }

  int _generateRandomNumber() {
    Random random = Random();
    return random.nextInt(255);
  }
}
