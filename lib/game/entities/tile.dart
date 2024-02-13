import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:leap/leap.dart';
import 'package:super_dash/game/entities/Defender.dart';
import 'package:super_dash/game/status/IgnoreGravity.dart';
import 'package:super_dash/game/super_dash_game.dart';

class TileMap extends PhysicalEntity<SuperDashGame> {
  TileMap() : super();

  static final _paint = Paint()..color = Colors.lightGreenAccent;

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

    final collisions = collisionInfo.allCollisions;

    if (collisions.isEmpty) return;

    for (final collision in collisions) {
      if (collision is Defender) {
        if (!collision.isDragged) {
          collision.position.x = position.x;
          collision.position.y = position.y;
        }
      }
    }
  }
}
