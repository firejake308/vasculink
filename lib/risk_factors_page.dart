import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vasculink/state_manager.dart';
import 'package:vasculink/vasculink_app_bar.dart';

class RiskFactorsPage extends StatelessWidget {
  // Helper function to create a new card
  Widget _createCard(RiskFactor riskFactor) {
    return StoreConnector<List<RiskFactor>, VoidCallback>(converter: (store) {
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
    return Scaffold(
      appBar: VasculinkAppBar('Risk Factors').build(context),
      body: SafeArea(
        child: StoreConnector<List<RiskFactor>, List<RiskFactor>>(
            converter: (store) => store.state,
            builder: (context, riskFactors) {
              // build cards for each risk factor
              List<Widget> cards = riskFactors.map(_createCard).toList();

              return SingleChildScrollView(
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
              ));
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/results');
        },
        backgroundColor: Theme.of(context).primaryColor,
        tooltip: 'Calculate risk',
        child: Icon(
          Icons.arrow_forward_ios,
          size: 24.0,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
