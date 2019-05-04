import 'package:flutter/material.dart';
import "package:intl/intl.dart";

import './memory.dart';
import './memory_editer.dart';

class MemoryView extends StatefulWidget {
  final Memory mem;
  MemoryView(this.mem);

  @override
  State<StatefulWidget> createState() {
    return _MemoryViewState(mem);
  }
}

class _MemoryViewState extends State<MemoryView> {
  final Memory mem;
  _MemoryViewState(this.mem);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mem.name),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MemoryEditor(mem),
                  )).then((value) {
                setState(() {});
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              Navigator.pop(context, mem);
            },
          ),
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
    return TextStyle(fontSize: 20);
  }
}
