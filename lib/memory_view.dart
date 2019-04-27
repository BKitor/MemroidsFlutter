import 'package:flutter/material.dart';

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
            icon: Icon(Icons.backspace),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: Center(
        child: mem.image,
      ),
    );
  }
}
