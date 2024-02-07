import 'dart:ui';

import 'package:flame/components.dart';

import 'package:flutter/material.dart';
import 'package:leap/leap.dart';

import 'package:super_dash/game/status/IgnoreGravity.dart';
import 'package:super_dash/game/super_dash_game.dart';
import 'package:super_dash/game/entities/Defender.dart';

class TileMap extends PhysicalEntity<SuperDashGame> {
  static final _paint = Paint()..color = Colors.lightGreenAccent;
  TileMap() : super();

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    final status = OnIgnoreGravity();
    add(status);
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRect(size.toRect(), _paint);
  }

  @override
  void update(double dt) {
    super.update(dt);

    final collisions = collisionInfo.allCollisions ?? const [];

    if (collisions.isEmpty) return;

    for (final collision in collisions) {
      if (collision is Defender) {
        if (!collision.isDragged) {
          collision.position.x = this.position.x;
          collision.position.y = this.position.y;
        }
      }
    }
  }
}
