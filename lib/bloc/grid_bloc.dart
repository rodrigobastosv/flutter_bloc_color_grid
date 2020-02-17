import 'dart:async';
import 'dart:convert';

import 'package:flutter_bloc_color_grid/model/tile.dart';
import 'package:flutter_bloc_color_grid/utils/grid_helper.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'bloc.dart';

class GridBloc extends HydratedBloc<GridEvent, GridState> {
  List<Tile> tiles;
  GridHelper helper;

  GridBloc(this.helper);

  @override
  GridState get initialState => super.initialState ?? InitialGridState(tiles);

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

  @override
  GridState fromJson(Map<String, dynamic> json) {
    try {
      final jsonTiles = json['tiles'];
      final jsonTilesList = jsonDecode(jsonTiles);
      tiles = List.generate(
          jsonTilesList.length, (i) => Tile.fromJson(jsonTilesList[i]));
      return InitialGridState(tiles);
    } catch (_) {
      print(_.toString());
      return null;
    }
  }

  @override
  Map<String, dynamic> toJson(GridState state) {
    try {
      if (state is AddedTileGridState) {
        return serializeTiles(state.tiles);
      }
      if (state is RemovedTileGridState) {
        return serializeTiles(state.tiles);
      }
      return null;
    } catch (_) {
      return null;
    }
  }

  Map<String, dynamic> serializeTiles(List<Tile> tiles) {
    return {
      'tiles': jsonEncode(
          List.generate(tiles.length, (i) => tiles[i].toJson()).toList()),
    };
  }
}
