import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_color_grid/model/tile.dart';
import 'package:meta/meta.dart';

@immutable
abstract class GridState extends Equatable {}

class InitialGridState extends GridState {
  @override
  List<Object> get props => [];
}

class AddedTileGridState extends GridState {
  AddedTileGridState(this.tiles);

  final List<Tile> tiles;

  @override
  List<Object> get props => [tiles];
}

class RemovedTileGridState extends GridState {
  RemovedTileGridState(this.tiles);

  final List<Tile> tiles;

  @override
  List<Object> get props => [tiles];
}

class NoTileLeftGridState extends GridState {
  @override
  List<Object> get props => [];
}
