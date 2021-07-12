import 'package:batman_test/Buttons/batman_buttons.dart';
import 'package:batman_test/SignUpScreen/batman_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BatmanSignUpScreen extends AnimatedWidget {
  const BatmanSignUpScreen(Animation animation, {Key? key})
      : super(key: key, listenable: animation);

  Animation<double> get _animationSignUpIn => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Opacity(
        opacity: _animationSignUpIn.value,
        child: Transform.translate(
          offset: Offset(
            0.0,
            100 * (1 - _animationSignUpIn.value),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'GET ACCESS',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                const BatmanInput(
                  label: 'FULL NAME',
                ),
                const BatmanInput(
                  label: 'EMAIL ID',
                ),
                const BatmanInput(
                  label: 'PASSWORD',
                  password: true,
                ),
                const SizedBox(height: 20),
                BatmanButton(
                  text: 'SIGN UP',
                  onTap: () {},
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
