import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TextFieldUpdate extends StatelessWidget {
  const TextFieldUpdate(
      {super.key, this.labelText, required this.textController, this.keyType, this.maxLine});

  final String? labelText;
  final TextEditingController textController;
  final keyType;
  final int? maxLine;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          maxLines: maxLine,
          style: TextStyle(fontWeight: FontWeight.bold),
          controller: textController,
          decoration: InputDecoration(
            labelText: labelText,
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}
