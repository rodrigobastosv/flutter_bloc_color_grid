import 'package:flutter/material.dart';
import 'package:flutter_bloc_color_grid/model/tile.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Tile tests', () {
    test('Test asserts', () {
      expect(() => Tile(index: 0), throwsAssertionError);
      expect(() => Tile(color: Colors.red), throwsAssertionError);
    });

    test('Test equality', () {
      final tile1 = Tile(index: 0, color: Colors.red);
      final tile2 = Tile(index: 0, color: Colors.red);
      expect(tile1, equals(tile2));
    });

    test('Test inequality', () {
      final tile1 = Tile(index: 0, color: Colors.red);
      final tile2 = Tile(index: 1, color: Colors.blue);
      expect(tile1 == tile2, false);
    });
  });
}
