import 'package:flutter/material.dart';

/// A reusable input field widget with a consistent style.
class InputField extends StatelessWidget {
  /// Controller for the text field.
  final TextEditingController textEditingController;

  /// The label text for the input field.
  final String labelText;

  /// Whether to hide the text (e.g., for passwords).
  final bool hidden;

  /// The icon to display before the input area.
  final IconData? iconData;

  /// Optional validator function for the input.
  final String? Function(String?)? validator;

  /// Creates an [InputField].
  const InputField({
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
              color: Colors.grey.withAlpha(50),
              spreadRadius: 3,
              blurRadius: 6,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: TextFormField(
          validator: validator,
          controller: textEditingController,
          obscureText: hidden,
          decoration: InputDecoration(
            prefixIcon: iconData != null ? Icon(iconData) : null,
            border: const OutlineInputBorder(),
            labelText: labelText,
          ),
        ),
      ),
    );
  }
}