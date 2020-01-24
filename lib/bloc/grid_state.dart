import 'package:flutter_bloc_color_grid/model/tile.dart';
import 'package:meta/meta.dart';

@immutable
abstract class GridState {}

class InitialGridState extends GridState {}

class AddedTileGridState extends GridState {
  AddedTileGridState(this.tiles);

  final List<Tile> tiles;
}

class RemovedTileGridState extends GridState {
  RemovedTileGridState(this.tiles);

  final List<Tile> tiles;
}

class NoTileLeftGridState extends GridState {}
