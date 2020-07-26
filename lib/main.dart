import 'dart:ui';
import 'dart:math' as math;
import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp()
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{

  //
  List<bool> isSelected;
  Card firstCard;
  Card secondCard;
  Card thirdCard;
  Card fourthCard;

  // Helper function to create a new card
  Card createCard(String targetText, IconData targetIcon, bool tapped){
    Card newCard = Card(
      color: tapped? Colors.blue : Colors.white,
      child: Center(
        child: ListTile(
          leading: Icon(targetIcon, color: tapped? Colors.white : Colors.black, size: 25,),
          title: Text(
            targetText,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: tapped? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
    return newCard;
  }
  

  @override
  void initState(){
    isSelected = [false,false,false,false];
    super.initState();
    firstCard = createCard("Smoker", Icons.smoking_rooms, false);
    secondCard = createCard("BMI > 30", Icons.warning, false);
    thirdCard = createCard("Reoperation", Icons.content_cut, false);
    fourthCard = createCard("Presence of prosthetic material", Icons.create, false);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar:PreferredSize(
            preferredSize: Size.fromHeight(130.0),
            child: AppBar(
              elevation: 0,
              flexibleSpace: Padding(
                padding: const EdgeInsets.fromLTRB(0,65,0,0),
                child: Row(
                  children:<Widget> [
                    IconButton(
                      icon: Icon(Icons.clear),
                      tooltip: "cancel the entry",
                      onPressed: (){
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
            )
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              SizedBox(height: 30,),
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
              SizedBox(height: 10,),
              InkWell(onTap: (){
                if(isSelected[0] == false){
                  setState(() {
                    firstCard = createCard("Smoker", Icons.smoking_rooms, true);
                    isSelected[0] = true;
                  });
                }
                else{
                  setState(() {
                    firstCard = createCard("Smoker", Icons.smoking_rooms, false);
                    isSelected[0] = false;
                  });
                }
              }, child: Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: firstCard,)),

              SizedBox(height: 5,),
              InkWell(onTap: (){
                if(isSelected[1] == false){
                  setState(() {
                    secondCard = createCard("BMI > 30", Icons.warning, true);
                    isSelected[1] = true;
                  });
                }
                else{
                  setState(() {
                    secondCard = createCard("BMI > 30", Icons.warning, false);
                    isSelected[1] = false;
                  });
                }
              }, child: Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: secondCard,)),

              SizedBox(height: 5,),
              InkWell(onTap: (){
                if(isSelected[2] == false){
                  setState(() {
                    thirdCard = createCard("Reoperation", Icons.content_cut, true);
                    isSelected[2] = true;
                  });
                }
                else{
                  setState(() {
                    thirdCard = createCard("Reoperation", Icons.content_cut, false);
                    isSelected[2] = false;
                  });
                }
              }, child: Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: thirdCard,)),

              SizedBox(height: 5,),
              InkWell(onTap: (){
                if(isSelected[3] == false){
                  setState(() {
                    fourthCard = createCard("Presence of prosthetic material", Icons.create, true);
                    isSelected[3] = true;
                  });
                }
                else{
                  setState(() {
                    fourthCard = createCard("Presence of prosthetic material", Icons.create, false);
                    isSelected[3] = false;
                  });
                }
              }, child: Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: fourthCard,)),

              SizedBox(height: 25),
              RawMaterialButton(
                onPressed: () {},
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

              SizedBox(height:10),
              Center(child:Text("Selection Complete", style: TextStyle(color: Colors.grey, fontSize: 18 ),)),
            ],
          ),
        ),
        /////////////////////////////////////////////////
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

        //////////////////////////////////////////////////
      ),
    );
  }
}

// testing:
class CircularOuterNotchedRectangle extends NotchedShape {
  /// Creates a [CircularOuterNotchedRectangle].
  ///
  /// The same object can be used to create multiple shapes.
  const CircularOuterNotchedRectangle({this.extraOffset = 10.0});

  final double extraOffset;

  /// Creates a [Path] that describes a rectangle with a smooth circular notch.
  ///
  /// `host` is the bounding box for the returned shape. Conceptually this is
  /// the rectangle to which the notch will be applied.
  ///
  /// `guest` is the bounding box of a circle that the notch accommodates. All
  /// points in the circle bounded by `guest` will be outside of the returned
  /// path.
  ///
  /// The notch is curve that smoothly connects the host's top edge and
  /// the guest circle.
  // TODO(amirh): add an example diagram here.
  @override
  Path getOuterPath(Rect host, Rect guest) {
    if (guest == null || !host.overlaps(guest)) return Path()..addRect(host);

    // The guest's shape is a circle bounded by the guest rectangle.
    // So the guest's radius is half the guest width.
    final double notchRadius = guest.width / 3;

    // We build a path for the notch from 3 segments:
    // Segment A - a Bezier curve from the host's top edge to segment B.
    // Segment B - an arc with radius notchRadius.
    // Segment C - a Bezier curve from segment B back to the host's top edge.
    //
    // A detailed explanation and the derivation of the formulas below is

    const double s1 = 15.0;
    const double s2 = 15.0;

    final double r = notchRadius + extraOffset/3;
    final double a = -1.0 * r - s2;
    final double b = host.top + guest.center.dy;

    final double n2 = math.sqrt(b * b * r * r * (a * a + b * b - r * r));
    final double p2xA = ((a * r * r) - n2) / (a * a + b * b);
    final double p2xB = ((a * r * r) + n2) / (a * a + b * b);
    final double p2yA = math.sqrt(r * r - p2xA * p2xA) - extraOffset/2-20;
    final double p2yB = math.sqrt(r * r - p2xB * p2xB) - extraOffset/2;

    final List<Offset> p = List<Offset>(6);

    // p0, p1, and p2 are the control points for segment A.
    p[0] = Offset(a - s1, b);
    p[1] = Offset(a, b);
    p[2] = p2yA > p2yB ? Offset(p2xA, -p2yA) : Offset(p2xB, p2yB);

    // p3, p4, and p5 are the control points for segment B, which is a mirror
    // of segment A around the y axis.
    p[3] = Offset(-1.0 * p[2].dx, -p[2].dy);
    p[4] = Offset(-1.0 * p[1].dx, p[1].dy);
    p[5] = Offset(-1.0 * p[0].dx, p[0].dy);

    // translate all points back to the absolute coordinate system.
    for (int i = 0; i < p.length; i += 1) p[i] += guest.center;

    return Path()
      ..moveTo(host.left, -host.top)
      ..lineTo(p[0].dx, p[0].dy)
      ..quadraticBezierTo(p[1].dx, p[1].dy, p[2].dx, -p[2].dy)
      ..arcToPoint(
        p[3],
        radius: Radius.circular(notchRadius),
        clockwise: true,
      )
      ..quadraticBezierTo(p[4].dx, p[4].dy, p[5].dx, p[5].dy)
      ..lineTo(host.right, host.top)
      ..lineTo(host.right, host.bottom)
      ..lineTo(host.left, host.bottom)
      ..close();
  }
}

//bottomNavigationBar: BottomNavigationBar(
//          backgroundColor: Colors.blueAccent,
//          items: <BottomNavigationBarItem>[
//            BottomNavigationBarItem(
//              icon: Icon(Icons.home, color: Colors.white,),
//              title: Text("HOME", style: TextStyle(color: Colors.white),),
//            ),
//            BottomNavigationBarItem(
//              icon: Icon(Icons.home, color: Colors.white,),
//              title: Text("NEW ENTRY", style: TextStyle(color: Colors.white),),
//            ),
//            BottomNavigationBarItem(
//              icon: Icon(Icons.home, color: Colors.white,),
//              title: Text("PREVIOUS RESULTS", style: TextStyle(color: Colors.white),),
//            ),
//          ],
//        ),