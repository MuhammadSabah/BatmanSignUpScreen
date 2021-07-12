import 'package:batman_test/Buttons/batman_buttons.dart';
import 'package:flutter/material.dart';

class BatmanFirstScreenButtons extends AnimatedWidget {
  const BatmanFirstScreenButtons(Animation animation, this.onTap, {Key? key})
      : super(key: key, listenable: animation);

  Animation<double> get _animationButtonsIn => listenable as Animation<double>;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Opacity(
        opacity: _animationButtonsIn.value,
        child: Transform.translate(
          offset: Offset(
            0.0,
            100 * (1 - _animationButtonsIn.value),
          ),
          child: Column(
            children: [
              BatmanButton(
                text: 'LOG IN',
                left: false,
                onTap: () {},
              ),
              const SizedBox(height: 20),
              BatmanButton(
                text: 'SIGN UP',
                left: true,
                onTap: onTap,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
