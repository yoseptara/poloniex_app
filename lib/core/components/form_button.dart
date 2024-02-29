import 'package:flutter/material.dart';

class FormButton extends StatelessWidget {
  final String text;
  final Function? onPressed;
  final bool enable;

  const FormButton(
      {this.text = '', this.onPressed, this.enable = true, super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return ElevatedButton(
      onPressed: enable ? onPressed as void Function()? : null,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: screenHeight * .02),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        backgroundColor: enable == false ? Colors.grey.shade400 : null,
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
