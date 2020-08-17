import 'package:card_slash/feature.dart';
import 'package:card_slash/service/method.dart';
import 'package:card_slash/widget/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListGistProvider with ChangeNotifier {
  List<GistData> listGist = List();
  List<Widget> listWidget = List();
  List<String> fileNameList;

  List<String> stringtoReturn = List();
  final int cardCount = 5;
  int orderLoop = 0;

  List<GistData> get listGistProvider => listGist;
  set listGistProvider(List<GistData> listGist) {
    this.listGist = listGist;
    ChangeNotifier();
  }

  void loadHere({int here = 0}) {
    int z = (cardCount - 1) + here;
    for (int i = 0; i < cardCount; i++) {
      if (z != listGist.length && z < listGist.length) {
        stringtoReturn.add(fileNameList[z]);
      } else if (z == listGist.length || z > listGist.length - 1) {
        int backCount = z - listGist.length;
        stringtoReturn.add(fileNameList[backCount]);
        if (z - fileNameList.length == cardCount - 1) {
          orderLoop = 0;
        }
      }
      z--;
    }
    _getMatchCard();
    ChangeNotifier();
  }

  void replacement() {
    print("hah");
    stringtoReturn.clear();
    listWidget.clear();
    orderLoop++;
    ChangeNotifier();
    // listGistProvider =
  }

  void _getMatchCard() {
    listWidget.clear();
    for (int x = 0; x < cardCount; x++) {
      final pat = (x + 1) * 10.0;
      listWidget
          .add(positions(x, pat, stringtoReturn[x], (_) => replacement()));
      ChangeNotifier();
    }
  }

  List<Widget> get returnWidgetProvider {
    fileNameList = gistToFileName(listGistProvider);
    loadHere(here: orderLoop);
    return listWidget;
  }
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
