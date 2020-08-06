import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vasculink/state_manager.dart';

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
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(130.0),
          child: AppBar(
            elevation: 0,
            flexibleSpace: Padding(
              padding: const EdgeInsets.fromLTRB(0, 65, 0, 0),
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.clear),
                    tooltip: "cancel the entry",
                    onPressed: () {
                      Navigator.pushNamed(context, '/');
                    },
                    color: Colors.white,
                    iconSize: 30,
                  ),
                  Text(
                    'Result',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            backgroundColor: Colors.blue[400],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(29),
              ),
            ),
          )),
      backgroundColor: Colors.grey[100],
      body: StoreConnector<List<RiskFactor>, int>(converter: (store) {
        return store.state.fold(
            0,
            (runningSum, riskFactor) =>
                runningSum + (riskFactor.value ? 1 : 0));
      }, builder: (context, riskLevel) {
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
                        '/',
                        style: TextStyle(
                          color: Colors.blue[400],
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '7',
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: Colors.blue,
        ),
        elevation: 5.0,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(Icons.home),
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Text('USE CARD'),
              ),
              Icon(Icons.person_outline)
            ],
          ),
        ),
        color: Colors.blue,
      ),
    );
  }
}
