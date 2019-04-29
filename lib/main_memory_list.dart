import 'package:flutter/material.dart';
import 'dart:async';

import './memory.dart';
import './memory_view.dart';

class MainMemoryList extends StatefulWidget {
  final List<Memory> memories;
  MainMemoryList(this.memories);

  @override
  State<StatefulWidget> createState() {
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
      body: _buildMemoryList(),
      floatingActionButton: FloatingActionButton(
        onPressed: onNewMemPressed,
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildMemoryList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemBuilder: (BuildContext _context, int i) {
        if (i.isOdd) {
          return Divider();
        }
        final int index = i ~/ 2;
        return _buildMemoryRow(memories[index]);
      },
      itemCount: memories.length*2,
    );
  }

  Widget _buildMemoryRow(Memory mem) {
    return ListTile(
      title: Text(mem.name),
      onTap: () {
        Navigator.push<Memory>(context,
                MaterialPageRoute(builder: (context) => MemoryView(mem)))
            .then((Memory modifiedMem) {
          setState(() {
            if (modifiedMem != null) {
              mem = modifiedMem;
            }else{
              memories.remove(mem);
            }
          });
        });
      },
    );
  }

  void onNewMemPressed() {
    Future<Memory> newMem = Navigator.pushNamed<Memory>(context, '/newMem');
  }
}
