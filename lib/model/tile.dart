import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class Tile extends Equatable {
  final int index;
  final Color color;
  final int rColor;
  final int gColor;
  final int bColor;
  final double opacity;

  Tile(
      {@required this.index,
      @required this.color,
      this.rColor,
      this.gColor,
      this.bColor,
      this.opacity})
      : assert(index != null),
        assert(color != null);

  static Tile fromJson(Map<String, dynamic> json) {
    return Tile(
      index: json['index'] as int,
      rColor: json['rColor'] as int,
      gColor: json['gColor'] as int,
      bColor: json['bColor'] as int,
      opacity: json['opacity'] as double,
      color: Color.fromRGBO(
          json['rColor'], json['gColor'], json['bColor'], json['opacity']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'index': index,
      'rColor': rColor,
      'gColor': gColor,
      'bColor': gColor,
      'opacity': opacity,
    };
  }

  @override
  List<Object> get props => [index];
}
