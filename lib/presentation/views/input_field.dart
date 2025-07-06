import 'package:flutter/material.dart';

// Inputfelder die alle gleich aussehen

// ignore: must_be_immutable
class InputField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String labelText;
  bool? hidden = false;
  IconData? iconData;
  String? Function(String?)? validator;

  InputField({
    super.key,
    required this.textEditingController,
    required this.labelText,
    this.validator,
    this.hidden = false,
    this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 50),
              spreadRadius: 3,
              blurRadius: 6,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: TextFormField(
          validator: validator ?? (value) => null,
          controller: textEditingController,
          obscureText: hidden ?? false,
          decoration: InputDecoration(
            prefixIcon: getIcon(), // Hinten dran kommt das Label
            border: const OutlineInputBorder(),
            labelText: labelText,
          ),
        ),
      ),
    );
  }

  Widget? getIcon() { //Wie if else. 
    if (iconData != null) {
      // Wenn ein Icon vorhanden ist, wird es angezeigt
      return Icon(iconData);
    }

    return null; // Wird nie ausgeführt, IconData ist null
  }
}
