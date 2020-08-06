import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:vasculink/result_page.dart';
// import 'package:vasculink/risk_factors_page.dart';
import 'package:vasculink/state_manager.dart';
// import 'package:vasculink/my_home_page.dart';

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
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.blue,
            // This makes the visual density adapt to the platform that you run
            // the app on. For desktop platforms, the controls will be smaller and
            // closer together (more dense) than on mobile platforms.
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: ResultPage(2),
        ));
  }
}
