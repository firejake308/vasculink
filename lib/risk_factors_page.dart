import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vasculink/state_manager.dart';
import 'package:vasculink/vasculink_app_bar.dart';

class RiskFactorsPage extends StatelessWidget {
  // Helper function to create a new card
  Widget _createCard(RiskFactor riskFactor) {
    return StoreConnector<AppState, VoidCallback>(converter: (store) {
      return () => store
          .dispatch(SetRiskFactorAction(riskFactor.index, !riskFactor.value));
    }, builder: (context, callback) {
      return InkWell(
        onTap: callback,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Card(
            color: riskFactor.value
                ? Theme.of(context).primaryColor
                : Colors.white,
            child: Center(
              child: ListTile(
                  leading: Icon(
                    riskFactor.icon,
                    color: riskFactor.value ? Colors.white : Colors.black,
                    size: 25,
                  ),
                  title: Text(riskFactor.name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: riskFactor.value ? Colors.white : Colors.black,
                      ))),
            ),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    SharedPreferences.getInstance().then((prefs) {
      if (prefs.getBool('tutorial_shown') == null) {
        Navigator.of(context).pushNamed('/onboarding');
      }
    });

    return StoreConnector<AppState, List<RiskFactor>>(
        converter: (store) => store.state.riskFactors
            .sublist(0, store.state.riskFactors.length - 1),
        builder: (context, baseRiskFactors) {
          // build cards for each risk factor
          List<Widget> cards = baseRiskFactors.map(_createCard).toList();

          return Scaffold(
            appBar: VasculinkAppBar('Risk Factors').build(context),
            body: SafeArea(
              child: SingleChildScrollView(
                  child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      "Select patient risk factors",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  ...cards
                ],
              )),
            ),
            floatingActionButton: StoreConnector<AppState, VoidCallback>(
                converter: (store) =>
                    () => store.dispatch(SetExpandedAlgorithmAction(true)),
                builder: (context, dispatchExpandedAlgo) {
                  return FloatingActionButton(
                    onPressed: () {
                      // if risk level is above 13, go straight to results
                      int riskLevel = baseRiskFactors.fold(
                          0,
                          (runningSum, riskFactor) =>
                              runningSum +
                              (riskFactor.value ? riskFactor.weight : 0));
                      if (riskLevel >= 13)
                        Navigator.pushNamed(context, '/results');
                      // otherwise, check if pt has ESRD to apply expanded algo
                      else {
                        dispatchExpandedAlgo();
                        Navigator.pushNamed(context, '/esrd');
                      }
                    },
                    backgroundColor: Theme.of(context).primaryColor,
                    tooltip: 'Calculate risk',
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 24.0,
                      color: Colors.white,
                    ),
                  );
                }),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
        });
  }
}
