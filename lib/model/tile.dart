import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class Tile extends Equatable {
  final int index;
  final Color color;

  Tile({@required this.index, @required this.color})
      : assert(index != null),
        assert(color != null);

  @override
  List<Object> get props => [index];
}
