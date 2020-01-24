import 'package:meta/meta.dart';

@immutable
abstract class GridEvent {}

class AddTileGridEvent extends GridEvent {}

class RemoveTileGridEvent extends GridEvent {
  RemoveTileGridEvent(this.index);

  final int index;
}
