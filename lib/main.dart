import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:vasculink/result_page.dart';
import 'package:vasculink/risk_factors_page.dart';
import 'package:vasculink/state_manager.dart';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StoreProvider(
        store: store,
        child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: RiskFactorsPage(),
            routes: <String, WidgetBuilder>{
              '/results': (BuildContext ctx) => ResultPage(),
            }));
  }
}