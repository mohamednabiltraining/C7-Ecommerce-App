import 'package:flutter/material.dart';

class FormSubmitButton extends StatelessWidget {
  String text;
  VoidCallback onPressed;

  FormSubmitButton(this.text, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            padding: EdgeInsets.symmetric(vertical: 24),
            backgroundColor: Colors.white),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: Theme.of(context).primaryColor),
        ));
  }
}
