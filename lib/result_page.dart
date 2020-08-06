import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vasculink/state_manager.dart';
import 'package:vasculink/vasculink_app_bar.dart';

class ResultPage extends StatelessWidget {
  ResultPage();

  String getImage(int riskLevel) {
    if (riskLevel < 3) {
      return 'images/LowRisk.png';
    } else if (riskLevel < 5) {
      return 'images/MediumRisk.png';
    }
    return 'images/HighRisk.png';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VasculinkAppBar('Results').build(context),
      backgroundColor: Colors.grey[100],
      body: StoreConnector<List<RiskFactor>, List<RiskFactor>>(
          converter: (store) {
        return store.state;
      }, builder: (context, riskFactors) {
        // calculate maximum and actual risk level
        int riskLevel = riskFactors.fold(
            0,
            (runningSum, riskFactor) =>
                runningSum + (riskFactor.value ? riskFactor.weight : 0));
        int maxRisk = riskFactors.fold(
            0, (runningSum, riskFactor) => runningSum + riskFactor.weight);

        // build the string for the appropriate risk level
        String riskLevelText;
        if (riskLevel < 3) {
          riskLevelText = 'Low';
        } else if (riskLevel < 5) {
          riskLevelText = 'Medium';
        } else {
          riskLevelText = 'High';
        }

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Patient Score',
              style: TextStyle(
                color: Colors.blue[400],
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              elevation: 0.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 60.0),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        riskLevel.toString(),
                        style: TextStyle(
                          color: Colors.blue[400],
                          fontSize: 55,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '/$maxRisk',
                        style: TextStyle(
                          color: Colors.blue[400],
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '$riskLevelText Risk',
                    style: TextStyle(
                      color: Colors.black26,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            Container(
              child: Image.asset(
                getImage(riskLevel),
                height: 180,
              ),
            ),
          ],
        );
      }),
    );
  }
}
