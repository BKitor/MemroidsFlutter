import 'package:flutter/material.dart';

import './memory.dart';
import './main_memory_list.dart';
import './new_memory.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final List<Memory> memories = [];

  @override
  Widget build(BuildContext context) {
    memories.add(
        Memory("Test1", DateTime.now(), Image.asset("assets/DioPearl.png")));
    memories.add(
        Memory("Test2", DateTime.now(), Image.asset("assets/DioAzura.png")));
    memories.add(
        Memory("Test3", DateTime.now(), Image.asset("assets/PickleDio.png")));

    return MaterialApp(
      home: MainMemoryList(memories),
      routes: <String, WidgetBuilder> {
        '/newMem': (BuildContext context)=>NewMem()
      },
    );
  }
}
