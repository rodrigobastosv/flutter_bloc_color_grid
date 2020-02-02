import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_color_grid/bloc/bloc.dart';

import 'model/tile.dart';
import 'utils/grid_helper.dart';
import 'widget/initial_state_widget.dart';
import 'widget/no_tile_left_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<GridBloc>(
        create: (_) => GridBloc(GridHelper()),
        child: GridPage(),
      ),
    );
  }
}

class GridPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<GridBloc, GridState>(
        listener: (_, state) {
          if (state is AddedTileGridState) {
            Scaffold.of(_).showSnackBar(
              SnackBar(
                content: Text('Tile Adicionado'),
                duration: Duration(milliseconds: 100),
              ),
            );
          }
          if (state is RemovedTileGridState) {
            Scaffold.of(_).showSnackBar(
              SnackBar(
                content: Text('Tile Removido'),
                duration: Duration(milliseconds: 100),
              ),
            );
          }
        },
        builder: (__, state) {
          if (state is AddedTileGridState) {
            return _buildGridWithTiles(state.tiles);
          } else if (state is RemovedTileGridState) {
            return _buildGridWithTiles(state.tiles);
          } else if (state is NoTileLeftGridState) {
            return NoTileLeftWidget();
          } else {
            return InitialStateWidget();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            BlocProvider.of<GridBloc>(context).add(AddTileGridEvent()),
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildGridWithTiles(List<Tile> tiles) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 1,
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
      ),
      itemCount: tiles.length,
      itemBuilder: (_, i) => TileWidget(i, tiles[i].color),
    );
  }
}

class TileWidget extends StatelessWidget {
  TileWidget(this.index, this.color);

  final int index;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          BlocProvider.of<GridBloc>(context).add(RemoveTileGridEvent(index)),
      child: Container(
        color: color,
      ),
    );
  }
}
