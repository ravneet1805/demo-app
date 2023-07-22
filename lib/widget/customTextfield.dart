import 'package:flutter/material.dart';

class CustomField extends StatefulWidget {
  final String hint;
  final String label;
  final TextEditingController controller;
  CustomField({
    Key? key,
    required this.hint,
    required this.label,
    required this.controller,
  }) : super(key: key);

  @override
  _CustomFieldState createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  Color fillColor = Colors.brown;

  Color selectColor(String input) {
    if (input.toLowerCase() == 'india') {
      return Colors.orange;
    }
    else if (input.toLowerCase() == 'pakistan') {
      return Colors.green;
    }
     else if (input.toLowerCase() == 'usa') {
      return Colors.red;
    } else {
      return fillColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Container(
        width: MediaQuery.of(context).size.width*0.7,
        child: TextField(
          controller: widget.controller,
          decoration: InputDecoration(
            contentPadding:
            EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            labelText: widget.label,
            labelStyle: TextStyle(
              color: Colors.grey,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.black,),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.black,),
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: widget.hint,
            border: InputBorder.none,
            filled: true,
            fillColor: Colors.white,
            hintStyle: TextStyle(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
