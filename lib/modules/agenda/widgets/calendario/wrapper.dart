import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  final Widget? title;
  final Widget child;

  const Wrapper({Key? key, this.title, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Palette.wrapperBg,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            Column(
              children: [
                title!,
                const SizedBox(height: 16.0),
              ],
            ),
          child
        ],
      ),
    );
  }
}

class Palette {
  static const Color background = Color(0xFF212121);
  static const Color wrapperBg = Color(0xFFEDEEF2);
}
