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
      ),
      body: Center(
        child: mem.image,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pop(context);
        },
        child: Icon(Icons.backspace),
      ),
    );
  }
}
