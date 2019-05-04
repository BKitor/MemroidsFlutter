import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

import './memory.dart';

class MemoryEditor extends StatefulWidget {
  final Memory mem;
  MemoryEditor(this.mem);

  @override
  State<StatefulWidget> createState() {
    return _MemoryEditorState(mem);
  }
}

class _MemoryEditorState extends State<MemoryEditor> {
  final Memory mem;
  _MemoryEditorState(this.mem);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit ${mem.name}"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Container(
              child: mem.image,
              padding: EdgeInsets.all(5),
            ),
            DateTimePickerFormField(
              editable: false,
              inputType: InputType.both,
              initialValue: mem.reminder,
              format: DateFormat("MMMM d, yyyy 'at' h:mm"),
              decoration: InputDecoration(
                  labelText: "Reminder Date/Time",
                  hasFloatingPlaceholder: false),
              onChanged: (dt) => setState(() => mem.reminder = dt),
            ),
            Text('${DateFormat.yMMMMd().format(mem.reminder)} at ${DateFormat.Hm().format(mem.reminder)}')
          ],
        ),
      ),
    );
  }
}
