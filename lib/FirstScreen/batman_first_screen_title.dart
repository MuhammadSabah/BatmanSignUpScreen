import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BatmanFirstScreenTitle extends AnimatedWidget {
  const BatmanFirstScreenTitle(Animation animation, {Key? key})
      : super(key: key, listenable: animation);
  Animation<double> get _animationLogoMoveUp => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _animationLogoMoveUp.value,
      child: Column(
        children: const [
          Text(
            'WELCOME TO',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          Text(
            'GOTHAM CITY',
            style: TextStyle(
              fontSize: 33,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
