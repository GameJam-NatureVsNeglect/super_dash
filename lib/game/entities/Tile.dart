import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:leap/leap.dart';

import '../super_dash_game.dart';
import 'Box.dart';
import 'item.dart';

class Tile_Test extends PhysicalEntity<SuperDashGame>   {
  static final _paint = Paint()..color = Colors.lightGreenAccent;

  bool _isDragged = false;

  @override
  void render(Canvas canvas) {
    canvas.drawRect(size.toRect(), _paint);
  }


  @override
  void update(double dt) {
    final collisions = collisionInfo.otherCollisions ?? const [];

    if (collisions.isEmpty) return;

    for (final collision in collisions) {
      if (collision is Box) {
        if(!collision.isDragged) {
          collision.position.x = this.position.x;
          collision.position.y = this.position.y;
        }
      }

    }

  }
}

