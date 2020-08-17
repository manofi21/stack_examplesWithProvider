import 'package:card_slash/service/service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'match_card.dart';
import 'SizeConfig.dart';
import 'feature.dart';

class S_tacks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ListGistProvider providers = Provider.of<ListGistProvider>(context);
    List<GistData> listGist = Provider.of<List<GistData>>(context);
    providers.listGistProvider = listGist;
    return Scaffold(
        appBar: AppBar(),
        floatingActionButton: FloatingActionButton(onPressed: () {
          print(Provider.of<List<GistData>>(context).length);
        }),
        body: listGist == null
            ? CircularProgressIndicator()
            : Consumer<ListGistProvider>(
                builder: (context, provid, _) => Stack(
                    overflow: Overflow.clip,
                    fit: StackFit.expand,
                    alignment: Alignment.bottomCenter,
                    children: provid.returnWidgetProvider))
              );
  }
}

// class S_tacks extends StatefulWidget {
//   @override
//   _S_tacksState createState() => _S_tacksState();
// }

// class _S_tacksState extends State<S_tacks> {
//   final int cardCount = 10;
//   List<String> strings = List();
//   List<String> save_strings = List();
//   int orderLoop = 1;
//   List<Widget> cardList = List();
//   final double patokan = 10;

//   void replacement() {
//     strings.clear();
//     loadHere(here: orderLoop);
//     orderLoop++;
//   }

//   @override
//   void initState() {
//     firstList().then((value) => loadHere());
//     super.initState();
//   }

//   Future<void> firstList() async {
//     List<GistData> gistDatas = await getPost();
//     gistDatas.reversed.forEach((f) {
//       setState(() {
//         save_strings.add(f.files.keys.first.toString());
//       });
//     });
//   }

//   void loadHere({int here = 0}) {
//     int z = (cardCount - 1) + here;
//     for (int i = 0; i < cardCount; i++) {
//       if (z != save_strings.length && z < save_strings.length){
//         strings.add(save_strings[z]);
//       }
//       else if(z == save_strings.length || z > save_strings.length - 1){
//         int backCount= z - save_strings.length;
//         strings.add(save_strings[backCount]);
//         if(z - save_strings.length == cardCount - 1){
//           orderLoop = 0;
//         }
//       }
//       z--;
//     }
//     setState(() {
//       _getMatchCard();
//     });
//   }

//   Widget loading({Widget body}) {
//     if ((strings.length == 0 && cardList.length == 0) || body == null) {
//       return Center(
//         child: CircularProgressIndicator(),
//       );
//     } else {
//       return body;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     PreferredSizeWidget inde = PreferredSize(
//       preferredSize: Size.fromHeight(6 * SizeConfig.imageSizeMultiplier + 20),
//       child: Padding(
//           padding: EdgeInsets.all(15),
//           child: customForm('Email Address', false, TextInputType.text)),
//     );
//     return Scaffold(
//         appBar: AppBar(
//           bottom: inde,
//           leading: Icon(
//             Icons.menu,
//             color: Colors.black,
//             size: 6 * SizeConfig.imageSizeMultiplier,
//           ),
//           actions: <Widget>[
//             Padding(
//                 padding: EdgeInsets.only(right: 20),
//                 child: Icon(
//                   Icons.shopping_cart,
//                   color: Colors.black,
//                   size: 6 * SizeConfig.imageSizeMultiplier,
//                 ))
//           ],
//         ),
//         body: loading(
//             body: Stack(
//                 overflow: Overflow.clip,
//                 fit: StackFit.expand,
//                 alignment: Alignment.center,
//                 children: cardList)));
//   }

//   void _getMatchCard() {
//     cardList.clear();
//     for (int x = 0; x < cardCount; x++) {
//       final pat = (x + 1) * patokan;
//       cardList.add(positions(x, pat, strings[x], (_)=> replacement()));
//     }
//   }
// }

// Widget customForm(
//     String hintText, bool obscureText, TextInputType keyboardType) {
//   return TextFormField(
//     obscureText: obscureText,
//     keyboardType: keyboardType,
//     decoration: InputDecoration(
//       focusedBorder: const OutlineInputBorder(
//         borderSide: const BorderSide(color: Colors.black, width: 1.0),
//       ),
//       contentPadding: EdgeInsets.all(8.0),
//       border: OutlineInputBorder(),
//       labelStyle: TextStyle(color: Colors.black),
//       hintText: hintText,
//     ),
//   );
// }
