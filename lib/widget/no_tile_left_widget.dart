import 'package:flutter/material.dart';

class NoTileLeftWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Container(
        child: Center(
          child: Text(
            'All the Tiles were removed. Tap on the FAB to add one.',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
