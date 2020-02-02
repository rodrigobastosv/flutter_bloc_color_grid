import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_color_grid/model/tile.dart';
import 'package:flutter_bloc_color_grid/utils/grid_helper.dart';

import 'bloc.dart';

class GridBloc extends Bloc<GridEvent, GridState> {
  List<Tile> tiles;
  GridHelper helper;

  GridBloc(this.helper) {
    tiles = [];
  }

  @override
  GridState get initialState => InitialGridState();

  @override
  Stream<GridState> mapEventToState(GridEvent event) async* {
    if (event is AddTileGridEvent) {
      final generatedTile = helper.generateTile(tiles.length);
      tiles = [...tiles];
      tiles.add(generatedTile);
      yield AddedTileGridState(tiles);
    }
    if (event is RemoveTileGridEvent) {
      tiles = [...tiles];
      tiles.removeAt(event.index);
      if (tiles.isEmpty) {
        yield NoTileLeftGridState();
      } else {
        yield RemovedTileGridState(tiles);
      }
    }
  }
}
