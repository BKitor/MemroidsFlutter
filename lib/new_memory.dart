import 'package:flutter/material.dart';

import './memory_view.dart';
import './memory.dart';

class NewMem extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return null;
  }
}

class _NewMemState extends State<NewMem> {
  @override
  Widget build(BuildContext context) {
    return MemoryView(Memory(
        "New memory", DateTime.now(), Image.asset('assets/DioPearl.png')));
  }
}
