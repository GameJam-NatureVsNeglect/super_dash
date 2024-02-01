import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';

class Box extends PositionComponent with DragCallbacks  {
  static final _paint = Paint()..color = Colors.blue;

  bool _isDragged = false;

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
  void render(Canvas canvas) {
    canvas.drawRect(size.toRect(), _paint);
  }
}

