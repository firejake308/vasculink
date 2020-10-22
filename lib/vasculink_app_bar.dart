import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vasculink/state_manager.dart';

class VasculinkAppBar extends StatelessWidget {
  final String _pageTitle;

  VasculinkAppBar(this._pageTitle);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(16),
          ),
        ),
        title: Text(
          _pageTitle,
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        leading: StoreConnector<AppState, List<Object>>(
            converter: (store) => [store.state.riskFactors, store.dispatch],
            builder: (context, storeConnection) {
              List<RiskFactor> riskFactors = storeConnection[0];
              Function dispatch = storeConnection[1];
              return IconButton(
                icon: ModalRoute.of(context).settings.name == '/'
                    ? Image.asset('images/v_icon.png')
                    : Icon(Icons.arrow_back),
                onPressed: () {
                  // reset all risk factors to false
                  riskFactors.asMap().forEach((idx, riskFactor) {
                    dispatch(SetRiskFactorAction(idx, false));
                  });
                  // by default, don't use expanded algorithm
                  dispatch(SetExpandedAlgorithmAction(false));
                  // return to risk factors page
                  Navigator.of(context).popUntil(ModalRoute.withName('/'));
                },
              );
            }));
  }
}
