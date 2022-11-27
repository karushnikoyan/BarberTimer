import 'package:flutter/material.dart';
import 'package:revers/consts/barber_consts.dart';
import 'package:revers/widgets/my_bubtton_container.dart';

class MyTextFiled extends StatelessWidget {
  String text;
  TextEditingController textEditingController;
  TextInputType textInputType;

  MyTextFiled({
    required this.text,
    required this.textEditingController,
    required this.textInputType
  });

  @override
  Widget build(BuildContext context) {
    return MyButtonContainer(
      widget: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: TextFormField(
          controller: textEditingController,
          keyboardType: textInputType,

          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: '$text',
            labelStyle: myTextStyle,
          ),

        ),
      ),
    );
  }
}
