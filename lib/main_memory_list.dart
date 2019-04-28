import 'package:flutter/material.dart';

import './memory.dart';
import './memory_view.dart';

class MainMemoryList extends StatefulWidget {
  final List<Memory> memories;
  MainMemoryList(this.memories);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MainMemoryListState(memories);
  }
}

class _MainMemoryListState extends State<MainMemoryList> {
  final List<Memory> memories;
  _MainMemoryListState(this.memories);

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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MemoryView(memories[index])));
            },
            child: Text(memories[index].name),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
