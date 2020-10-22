import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vasculink/state_manager.dart';
import 'package:vasculink/vasculink_app_bar.dart';

class ESRDPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: VasculinkAppBar('Risk Factors (cont.)').build(context),
        body: SafeArea(
            child: Align(
                alignment: Alignment.topCenter,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, 30, 30, 24),
                      child: Text(
                        "Does the patient have ESRD?",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    StoreConnector<AppState, Function(bool, BuildContext)>(
                      converter: (store) => (bool value, BuildContext context) {
                        store.dispatch(SetRiskFactorAction(
                            store.state.riskFactors.length - 1, value));
                        Navigator.of(context).pushNamed('/results');
                      },
                      builder: (context, setESRD) {
                        return Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            RaisedButton(
                                onPressed: () => setESRD(true, context),
                                child: Text('Yes',
                                    style: TextStyle(color: Colors.white)),
                                color: Theme.of(context).primaryColor),
                            SizedBox(
                              width: 8,
                            ),
                            RaisedButton(
                                onPressed: () => setESRD(false, context),
                                child: Text('No'),
                                color: Colors.white),
                          ],
                        );
                      },
                    )
                  ],
                ))));
  }
}
