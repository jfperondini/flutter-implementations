import 'package:flutter/material.dart';

class TextFieldComponent extends StatelessWidget {
  final bool passwoardVisibility;
  final TextEditingController textController;
  final String labelText;
  final String hintText;
  final Widget? iconSuffix;
  final Widget? iconPrefix;
  final VoidCallback? onPressedIcon;
  final String? Function(String? text)? validator;
  final void Function(String? text)? onSaved;
  final void Function(String text)? onChanged;
  final TextInputType textInputType;

  const TextFieldComponent({
    Key? key,
    required this.passwoardVisibility,
    required this.textController,
    required this.labelText,
    required this.hintText,
    this.iconSuffix,
    this.iconPrefix,
    this.onPressedIcon,
    this.validator,
    this.onSaved,
    this.onChanged,
    required this.textInputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: textInputType,
      obscureText: passwoardVisibility,
      controller: textController,
      validator: validator,
      onChanged: onChanged,
      onSaved: onSaved,
      decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          border: const OutlineInputBorder(),
          suffix: iconSuffix,
          prefix: iconPrefix),
    );
  }
}
