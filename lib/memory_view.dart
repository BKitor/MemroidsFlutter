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
            icon: Icon(Icons.check),
            onPressed: () {
              Navigator.pop(context, mem);
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
