import 'package:flutter/material.dart';

class RiskFactor {
  final String name;
  final int index;
  final IconData icon;
  final int weight;
  bool value;

  RiskFactor(this.index, this.name, this.weight, this.icon,
      {this.value = false});
}

// encapsulates an update to the value of a risk factor
class SetRiskFactorAction {
  final int riskFactorNum;
  final bool value;

  SetRiskFactorAction(this.riskFactorNum, this.value);
}

// list the order of the risk factors for later reference
Map<String, int> riskFactors; //Smoking, Obesity, Reoperation, ESRD

// applies updates to the risk factors
List<RiskFactor> riskFactorsReducer(List<RiskFactor> state, dynamic action) {
  if (action is SetRiskFactorAction) {
    List<RiskFactor> newState = List.from(state);
    newState[action.riskFactorNum].value = action.value;
    return newState;
  }

  // default is to just return the state as it was
  print(action);
  return state;
}
