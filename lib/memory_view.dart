import 'package:flutter/material.dart';
import "package:intl/intl.dart";

import './memory.dart';

class MemoryView extends StatelessWidget {
  final Memory mem;
  MemoryView(this.mem);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mem.name),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              Navigator.pop(context, mem);
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: mem.image,
            padding: EdgeInsets.all(10),
          ),
          Text(
            "Remeinder set for ${_printDate()}",
            style: _remeinderDateStyle(),
          ),
        ],
      ),
    );
  }

  String _printDate() {
    return "${DateFormat.LLLL().format(mem.reminder)} ${DateFormat.d().format(mem.reminder)} ${DateFormat.y().format(mem.reminder)} at ${DateFormat.jm().format(mem.reminder)}";
  }

  TextStyle _remeinderDateStyle() {
    return TextStyle(
      fontSize: 20
    );
  }

}
