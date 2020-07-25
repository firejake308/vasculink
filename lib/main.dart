import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vasculink App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Vasculink'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
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

      backgroundColor: Colors.grey[100],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:<Widget> [
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
              children:<Widget> [
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:<Widget> [
                    Text('4',
                      style: TextStyle(
                        color: Colors.blue[400],
                        fontSize: 55,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('/',
                      style: TextStyle(
                        color: Colors.blue[400],
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('7',
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
                Text('Medium Risk',
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
                  'images/dial.png',
                  height: 150,
//                  width: 100,
                ),
              ),
        ],
      ),
    );
  }
}