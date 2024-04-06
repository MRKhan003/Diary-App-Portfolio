import 'package:flutter/material.dart';

class textFieldsData extends StatelessWidget {
  final String hintText,labelText;
  final TextEditingController editingController;
  textFieldsData({required this.hintText,required this.editingController,required this.labelText,});
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: editingController,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText ,
        hintStyle: TextStyle(
          color: Colors.black,
        ),
        enabled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              10,
            ),
          ),
          borderSide: BorderSide(
            color: Colors.red,
            style: BorderStyle.solid,
          ),
        ),
      ),
    );
  }
}
