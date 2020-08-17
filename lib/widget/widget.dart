  import 'package:flutter/material.dart';

Widget positions(int x, double ftop, String str){ //, VoidCallback callBacks) {
    return Positioned(
        top: ftop,
        child: Draggable(
            childWhenDragging: Container(),
            child: GestureDetector(
              onHorizontalDragEnd: (_) {
                // print(i);
                // callBacks();
                // replacement();
              },
              onHorizontalDragCancel: () {},
              child: Card(
                elevation: 12,
                // color: Color.fromARGB(255, cards[x].redColor,
                //     cards[x].greenColor, cards[x].blueColor),
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
              // color: Color.fromARGB(255, cards[x].redColor, cards[x].greenColor,
              //     cards[x].blueColor),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Container(
                width: 240,
                height: 300,
                child: Text(str),
              ),
            )));
  }