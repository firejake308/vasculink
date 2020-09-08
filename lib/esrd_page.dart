import 'package:flutter/material.dart';
import 'package:vasculink/vasculink_app_bar.dart';

class ESRDPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: VasculinkAppBar('Risk Factors 2').build(context),
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
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        RaisedButton(
                            onPressed: () => null,
                            child: Text('Yes',
                                style: TextStyle(color: Colors.white)),
                            color: Theme.of(context).primaryColor),
                        SizedBox(
                          width: 8,
                        ),
                        RaisedButton(
                            onPressed: () => null,
                            child: Text('No'),
                            color: Colors.white),
                      ],
                    )
                  ],
                ))));
  }
}
