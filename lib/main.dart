import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:vasculink/result_page.dart';
import 'package:vasculink/risk_factors_page.dart';
import 'package:vasculink/state_manager.dart';

void main() {
  const riskFactorNames = [
    ["Smoker", Icons.smoking_rooms],
    ["BMI > 30", Icons.warning],
    ["Reoperation", Icons.content_cut],
    ["Presence of prosthetic material", Icons.create],
  ];
  var initialState = riskFactorNames
      .asMap()
      .entries
      .map((e) => RiskFactor(e.key, e.value[0], e.value[1]))
      .toList();
  final store = new Store(riskFactorsReducer, initialState: initialState);
  runApp(MyApp(store));
}

class MyApp extends StatelessWidget {
  final Store<List<RiskFactor>> store;

  MyApp(this.store);

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
