
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:vasculink/onboarding_page.dart';
import 'package:vasculink/result_page.dart';
import 'package:vasculink/risk_factor_clearer.dart';
import 'package:vasculink/risk_factors_page.dart';
import 'package:vasculink/state_manager.dart';

void main() {
  const riskFactorNames = [
    ["Female", 2, Icons.wc],
    ["Smoker", 1, Icons.smoking_rooms],
    ["BMI > 30", 5, Icons.warning],
    ["Reoperation", 7, Icons.replay],
    ["Prosthetic reconstruction", 1, Icons.content_cut],
  ];
  var initialState = riskFactorNames
      .asMap()
      .entries
      .map((e) => RiskFactor(e.key, e.value[0], e.value[1], e.value[2]))
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
          title: 'Vasculink',
          theme: ThemeData(
            primaryColor: Colors.blue,
            accentColor: Colors.lightBlue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: RiskFactorsPage(),
          routes: <String, WidgetBuilder>{
            '/onboarding': (BuildContext ctx) => OnBoardingPage(),
            '/results': (BuildContext ctx) => ResultPage(),
          },
          navigatorObservers: <NavigatorObserver>[RiskFactorClearer(store)],
        ));
  }
}



