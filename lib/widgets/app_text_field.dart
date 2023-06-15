import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  final labelText;
  final String? Function(String?) onValidate;
  final Function(String?) onSaved;
  var keyboardType = TextInputType.text;
  var obscureText = false;
  AppTextField({
    super.key,
    required this.labelText,
    required this.onValidate,
    required this.onSaved,
  });
  AppTextField.pass({
    super.key,
    required this.labelText,
    required this.onValidate,
    required this.onSaved,
    this.keyboardType = TextInputType.visiblePassword,
    this.obscureText = true,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText,
        onSaved: (newValue) {
          setState(() {
            widget.onSaved(newValue);
          });
        },
        validator: widget.onValidate,
        decoration: InputDecoration(
          labelText: widget.labelText,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
