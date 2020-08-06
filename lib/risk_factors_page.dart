import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vasculink/state_manager.dart';

class RiskFactorsPage extends StatefulWidget {
  @override
  _RiskFactorsPageState createState() => _RiskFactorsPageState();
}

class _RiskFactorsPageState extends State<RiskFactorsPage> {
  int riskLevel;
  List<Card> cards;

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
            color: riskFactor.value ? Colors.blue : Colors.white,
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
      body: SafeArea(
        child: StoreConnector<List<RiskFactor>, List<RiskFactor>>(
            converter: (store) => store.state,
            builder: (context, riskFactors) {
              // build cards for each risk factor
              List<Widget> cards = riskFactors.map(_createCard).toList();

              return Column(
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
                  ...cards,
                  RawMaterialButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/results');
                    },
                    elevation: 2.0,
                    fillColor: Colors.blue,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 35.0,
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.all(15.0),
                    shape: CircleBorder(),
                  ),
                  SizedBox(height: 10),
                  Center(
                      child: Text(
                    "Selection Complete",
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  )),
                ],
              );
            }),
      ),
      /////////////////////////////////////////////////
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {},
          child: Icon(
            Icons.add,
            color: Colors.blue,
          ),
          elevation: 2.0,
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.black54, blurRadius: 10)]),
        child: BottomAppBar(
          //shape: CircularOuterNotchedRectangle(),
          //notchMargin: 1.0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Text('New Entry'),
                ),
                Icon(Icons.person_outline, color: Colors.white)
              ],
            ),
          ),
          color: Colors.blue,
        ),
      ),

      //////////////////////////////////////////////////
    );
  }
}
