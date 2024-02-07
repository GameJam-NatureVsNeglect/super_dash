import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:flutter/material.dart';
import 'package:leap/leap.dart';

import '../super_dash_game.dart';
import 'Box.dart';
import 'item.dart';




  class OnIgnoreGravity extends StatusComponent with IgnoresGravity  {

    @override
    void onMount() {
      super.onMount();
    }

    @override
    void onRemove() {
      super.onRemove();
    }

  }


class TestBehavior extends PhysicalBehavior<Tile_Test> {
  @override
  void update(double dt) {

      super.update(dt);

      final ladderStatus = parent.getStatus<OnIgnoreGravity>();
      ladderStatus?.position.x = 0;
    }

}

class Tile_Test extends  PhysicalEntity<SuperDashGame>   {
  static final _paint = Paint()..color = Colors.lightGreenAccent;
  Tile_Test()
      : super();
  bool _isDragged = false;

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
      if (collision is Box) {
        if(!collision.isDragged) {
        collision.position.x = this.position.x;
        collision.position.y = this.position.y;
        }
      }

    }

  }
}

