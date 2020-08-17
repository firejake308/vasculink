import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:vasculink/state_manager.dart';

class RiskFactorClearer extends NavigatorObserver {
  final Store<List<RiskFactor>> store;

  RiskFactorClearer(this.store);

  @override
  void didPop(Route route, Route previousRoute) {
    // reset all risk factors to false
    store.state.asMap().forEach((idx, riskFactor) {
      store.dispatch(SetRiskFactorAction(idx, false));
    });
    super.didPop(route, previousRoute);
  }
}
