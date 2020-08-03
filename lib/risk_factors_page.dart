import 'dart:ui';
import 'dart:math' as math;
import 'package:flutter/material.dart';

class RiskFactorsPage extends StatefulWidget {
  @override
  _RiskFactorsPageState createState() => _RiskFactorsPageState();
}

class _RiskFactorsPageState extends State<RiskFactorsPage> {
  int riskLevel;
  List<bool> isSelected;
  Card firstCard;
  Card secondCard;
  Card thirdCard;
  Card fourthCard;

  void changeRiskLevel() {
    isSelected.forEach((element) {
      if (element == true) {
        riskLevel += 1;
      } else {
        riskLevel -= 1;
      }
    });
  }

  // Helper function to create a new card
  Card createCard(String targetText, IconData targetIcon, bool tapped) {
    Card newCard = Card(
      color: tapped ? Colors.blue : Colors.white,
      child: Center(
        child: ListTile(
          leading: Icon(
            targetIcon,
            color: tapped ? Colors.white : Colors.black,
            size: 25,
          ),
          title: Text(
            targetText,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: tapped ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
    return newCard;
  }

  @override
  void initState() {
    isSelected = [false, false, false, false];
    riskLevel = 0;
    super.initState();
    firstCard = createCard("Smoker", Icons.smoking_rooms, false);
    secondCard = createCard("BMI > 30", Icons.warning, false);
    thirdCard = createCard("Reoperation", Icons.content_cut, false);
    fourthCard =
        createCard("Presence of prosthetic material", Icons.create, false);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
                        // TODO: implement cancel function
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
              SizedBox(
                height: 10,
              ),
              InkWell(
                  onTap: () {
                    if (isSelected[0] == false) {
                      setState(() {
                        firstCard =
                            createCard("Smoker", Icons.smoking_rooms, true);
                        isSelected[0] = true;
                      });
                    } else {
                      setState(() {
                        firstCard =
                            createCard("Smoker", Icons.smoking_rooms, false);
                        isSelected[0] = false;
                      });
                    }
                    changeRiskLevel();
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: firstCard,
                  )),
              SizedBox(
                height: 5,
              ),
              InkWell(
                  onTap: () {
                    if (isSelected[1] == false) {
                      setState(() {
                        secondCard =
                            createCard("BMI > 30", Icons.warning, true);
                        isSelected[1] = true;
                      });
                    } else {
                      setState(() {
                        secondCard =
                            createCard("BMI > 30", Icons.warning, false);
                        isSelected[1] = false;
                      });
                    }
                    changeRiskLevel();
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: secondCard,
                  )),
              SizedBox(
                height: 5,
              ),
              InkWell(
                  onTap: () {
                    if (isSelected[2] == false) {
                      setState(() {
                        thirdCard =
                            createCard("Reoperation", Icons.content_cut, true);
                        isSelected[2] = true;
                      });
                    } else {
                      setState(() {
                        thirdCard =
                            createCard("Reoperation", Icons.content_cut, false);
                        isSelected[2] = false;
                      });
                    }
                    changeRiskLevel();
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: thirdCard,
                  )),
              SizedBox(
                height: 5,
              ),
              InkWell(
                  onTap: () {
                    if (isSelected[3] == false) {
                      setState(() {
                        fourthCard = createCard(
                            "Presence of prosthetic material",
                            Icons.create,
                            true);
                        isSelected[3] = true;
                      });
                    } else {
                      setState(() {
                        fourthCard = createCard(
                            "Presence of prosthetic material",
                            Icons.create,
                            false);
                        isSelected[3] = false;
                      });
                    }
                    changeRiskLevel();
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: fourthCard,
                  )),
              SizedBox(height: 25),
              RawMaterialButton(
                onPressed: () {
                  // TODO: Implement page jump here
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
          ),
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
      ),
    );
  }
}
