import 'package:flutter/material.dart';

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
    );
  }
}
