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
  bool deleting = false;
  _MainMemoryListState(this.memories);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Memroids"),
        actions: <Widget>[
          _deletingButtonWidget(),
        ],
      ),
      body: _buildMemoryList(),
      floatingActionButton: FloatingActionButton(
        onPressed: onNewMemPressed,
        child: Icon(Icons.create),
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
      itemCount: memories.length * 2,
    );
  }

  Widget _buildMemoryRow(Memory mem) {
    return ListTile(
      title: Text(mem.name),
      onTap: deleting
          ? () {
              setState(() {
                memories.remove(mem);
              });
            }
          : () {
              Navigator.push<Memory>(context,
                      MaterialPageRoute(builder: (context) => MemoryView(mem)))
                  .then((Memory modifiedMem) {
                setState(() {
                  if (modifiedMem != null) {
                    mem = modifiedMem;
                  } 
                });
              });
            },
    );
  }

  void onMemPressedView() {}

  void onMemPressedDel() {}

  Widget _deletingButtonWidget() {
    return IconButton(
      icon: Icon(
        Icons.remove,
        color: deleting ? Colors.red : Colors.white,
      ),
      onPressed: () {
        setState(() {
          deleting = !deleting;
        });
      },
    );
  }

  void onNewMemPressed() {
    Navigator.push<Memory>(
        context,
        MaterialPageRoute(
            builder: (context) => MemoryView(Memory("NewMem", DateTime.now(),
                Image.asset("assets/DioPearl.png"))))).then((Memory newMem) {
      setState(() {
        if (newMem != null) {
          memories.add(newMem);
        }
      });
    });
  }
}
