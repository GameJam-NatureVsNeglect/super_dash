import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:leap/leap.dart';
import 'package:super_dash/game/game.dart';

import '../super_dash_game.dart';
import 'Tile.dart';





class Box extends  PhysicalEntity<SuperDashGame> with DragCallbacks  {

  Box() : super();

  static final _paint = Paint()..color = Colors.blue;
  late final EnemyType type;
  bool _isDragged = false;
  bool get isDragged => _isDragged;

  @override
  void onDragStart(DragStartEvent event) {
    super.onDragStart(event);

    _isDragged = true;
  }



  @override
  void onDragUpdate(DragUpdateEvent event) => position += event.localDelta;

  @override
  void onDragEnd(DragEndEvent event) {
    super.onDragEnd(event);
    _isDragged = false;

  }
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    final status = OnIgnoreGravity();
    add(status);
    type = EnemyType.ant;
  }

  @override
  void render(Canvas canvas) {

    canvas.drawRect(size.toRect(), _paint);
  }
}

