import 'package:flutter/material.dart';

class BatmanInput extends StatelessWidget {
  const BatmanInput({Key? key, required this.label, this.password = false})
      : super(key: key);

  final String label;
  final bool password;

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.shade800,
        width: 1.0,
      ),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        obscureText: password ? true : false,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
        cursorColor: Colors.grey.shade800,
        autocorrect: false,
        autofocus: false,
        decoration: InputDecoration(
          focusedBorder: border,
          labelText: label,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: TextStyle(
            fontSize: 16,
            color: Colors.grey.shade700,
          ),
          enabledBorder: border,
          border: border,
          suffixIcon: password
              ? Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: UnconstrainedBox(
                    child: Image.asset(
                      'assets/batman_logo.png',
                      height: 15,
                    ),
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
