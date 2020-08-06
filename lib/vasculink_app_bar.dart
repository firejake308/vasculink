import 'package:flutter/material.dart';

class VasculinkAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
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
        ));
  }
}
