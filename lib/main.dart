import 'package:card_slash/stacks.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'SizeConfig.dart';
import 'feature.dart';
import 'service/service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return MultiProvider(
                providers: [
                  ChangeNotifierProvider(create: (_) => ListGistProvider()),
                  FutureProvider(create: (_) => getPost())
                ],
                child: MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'HomeScreen App',
                  home: S_tacks(),
                ));
          },
        );
      },
    );
  }
}
// MultiProvider(
//   providers: [
//     ChangeNotifierProvider(create: (_) => Counter()),
//   ],
//   child: MyApp(),
// ),
