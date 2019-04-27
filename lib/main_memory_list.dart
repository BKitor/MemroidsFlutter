import 'package:flutter/material.dart';

import './memory.dart';
import './memory_view.dart';

class MainMemoryList extends StatelessWidget {
  final List<Memory> memories;
  MainMemoryList(this.memories);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Memroids"),
      ),
      body: ListView.builder(
        itemCount: memories.length,
        itemBuilder: (context, index) {
          return FlatButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MemoryView(memories[index])));
            },
            child: Text(memories[index].name),
          );
        },
      ),
    );
  }
}
