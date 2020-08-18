import 'package:card_slash/feature.dart';
import 'package:card_slash/service/method.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget positions(
    int x, double ftop, String str, Function(DragEndDetails) voidCallBacks) {
  return Positioned(
      top: ftop,
      child: Draggable(
          childWhenDragging: Container(),
          child: GestureDetector(
            onHorizontalDragEnd: voidCallBacks,
            onHorizontalDragCancel: () {},
            child: Card(
              elevation: 12,
              color: Color.fromARGB(255, 255, 0, 0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Container(
                width: 240,
                height: 300,
                child: Text(str),
              ),
            ),
          ),
          feedback: Card(
            elevation: 12,
            color: Color.fromARGB(255, 255, 0, 0),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(
              width: 240,
              height: 300,
              child: Text(str),
            ),
          )));
}
