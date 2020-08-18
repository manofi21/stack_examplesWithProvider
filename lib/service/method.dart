import 'package:card_slash/constant.dart';
import 'package:card_slash/feature.dart';
import 'package:flutter/material.dart';

List<String> gistToFileName(List<GistData> gistDataList) {
  List<String> save_strings = List();
  List<GistData> gistDatas = gistDataList;
  gistDatas.reversed.forEach((f) {
    save_strings.add(f.files.keys.first.toString());
  });
  return save_strings;
}

List<String> loadHere(List<GistData> listGist,{int here = 0}) {
  List<String> strings = List();
  List<String> lString = gistToFileName(listGist);
  int z = (cardCount - 1) + here;
  for (int i = 0; i < cardCount; i++) {
    if (z != lString.length && z < lString.length) {
      strings.add(lString[z]);
    } else if (z == lString.length || z > lString.length - 1) {
      int backCount = z - lString.length;
      strings.add(lString[backCount]);
      if (z - lString.length == cardCount - 1) {
        orderLoop = 0;
      }
    }
    z--;
  }
  return strings;
}

Widget checkError(
    List<String> defaultString, Function(DragEndDetails) voidCallBacks) {
  //, List<String> newListString) {
  Widget defaultW;
  // List<String> strings =
  //     defaultString.length > 0 ? defaultString : newListString;
  try {
    // defaultW = ListView(children: defaultString.map((e) => Text(e)).toList());
    defaultW = Stack(
        overflow: Overflow.clip,
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: positionsProviders(defaultString, voidCallBacks));
  } catch (e) {
    defaultW = Column(
      children: [CircularProgressIndicator(), Text(e.toString())],
    );
  }
  return defaultW;
}


List<Widget> positionsProviders(List<String> stringListProvider, Function(DragEndDetails) voidCallBacks) {
  List<Widget> cardList = List();
  cardList.clear();
  for (int x = 0; x < 10; x++) {
    final pat = (x + 1.0) * 10;
    cardList.add(positions(x, pat, stringListProvider[x], voidCallBacks));
  }
  return cardList;
}

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
