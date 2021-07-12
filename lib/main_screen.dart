import 'package:batman_test/SignUpScreen/batman_city.dart';
import 'package:batman_test/FirstScreen/batman_first_screen_buttons.dart';
import 'package:batman_test/FirstScreen/batman_first_screen_title.dart';
import 'package:batman_test/SignUpScreen/batman_sign_up_screen.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

const _batmanVerticalMovement = 60;

class BatmanSignUp extends StatefulWidget {
  const BatmanSignUp({Key? key}) : super(key: key);

  @override
  _BatmanSignUpState createState() => _BatmanSignUpState();
}

class _BatmanSignUpState extends State<BatmanSignUp>
    with TickerProviderStateMixin {
  ///FIRST ANIMATIONS...
  late AnimationController _animationController;
  late Animation<double> _animationLogoIn;
  late Animation<double> _animationLogoMoveUp;
  late Animation<double> _animationBatmanIn;
  late Animation<double> _animationButtonsIn;

  ///SECOND ANIMATIONS...
  late AnimationController _animationControllerSignUp;
  late Animation<double> _animationLogoAndTextOut;
  late Animation<double> _animationBatmanUp;
  late Animation<double> _animationBatmanCity;
  late Animation<double> _animationSignUpIn;

  ///FIRST METHOD FOR ANIMATIONS......
  void _setUpFirstAnimations() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    _animationLogoIn = Tween(begin: 30.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.25),
      ),
    );
    _animationLogoMoveUp = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.35, 0.60),
    );
    _animationBatmanIn = Tween(begin: 4.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.7, 1.0, curve: Curves.decelerate),
      ),
    );
    _animationButtonsIn = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.7, 1.0),
    );
    _animationController.forward();
  }

  ///SECOND METHOD FOR ANIMATIONS......
  void _setUpSecondAnimations() {
    _animationControllerSignUp = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    );
    _animationLogoAndTextOut = CurvedAnimation(
      parent: _animationControllerSignUp,
      curve: const Interval(0.0, 0.25),
    );
    _animationBatmanUp = CurvedAnimation(
      parent: _animationControllerSignUp,
      curve: const Interval(0.35, 0.55),
    );
    _animationBatmanCity = CurvedAnimation(
      parent: _animationControllerSignUp,
      curve: const Interval(0.65, 0.8),
    );
    _animationSignUpIn = CurvedAnimation(
      parent: _animationControllerSignUp,
      curve: const Interval(0.85, 1.0, curve: Curves.decelerate),
    );
  }

  ///INTERVAL USED FOR SEPARATING EACH ANIMATION ACCORDING TO THE CONTROLLER'S SECONDS,
  /// AND THEN ANIMATING EACH WIDGET ONE AFTER ANOTHER.
  void _onSignUpButton() {
    _animationControllerSignUp.forward(from: 0.0);
  }

  @override
  void initState() {
    _setUpFirstAnimations();
    _setUpSecondAnimations();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _animationControllerSignUp.dispose();
    super.dispose();
  }

  ///ANIMATED BUILDER FOR BOTH CONTROLLERS....
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: Listenable.merge(
            [_animationController, _animationControllerSignUp]),
        builder: (context, _) {
          return Scaffold(
            backgroundColor: const Color(0xff100f0b),
            body: SafeArea(
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    right: 0,
                    left: 0,
                    child: Image.asset(
                      'assets/batman_background.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    left: 0,
                    child: Transform.translate(
                      offset: Offset(
                        0.0,
                        _batmanVerticalMovement *
                                _animationLogoAndTextOut.value +
                            -_animationBatmanUp.value * _batmanVerticalMovement,
                      ),
                      child: Transform.scale(
                        scale: _animationBatmanIn.value,
                        child: Image.asset(
                          'assets/batman_alone.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height / 4.1,
                    left: 50,
                    right: 50,
                    child: BatmanCity(_animationBatmanCity),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height / 2,
                    right: 0,
                    left: 0,
                    bottom: 0,
                    child: BatmanSignUpScreen(_animationSignUpIn),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height / 2,
                    right: 0,
                    left: 0,
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        Transform.translate(
                          offset: Offset(
                            0.0,
                            _batmanVerticalMovement *
                                _animationLogoAndTextOut.value,
                          ),
                          child: Opacity(
                            opacity: (1 - _animationLogoAndTextOut.value),
                            child: BatmanFirstScreenTitle(_animationLogoMoveUp),
                          ),
                        ),
                        const SizedBox(height: 50),
                        Transform.translate(
                          offset: Offset(
                            0.0,
                            _batmanVerticalMovement *
                                _animationLogoAndTextOut.value,
                          ),
                          child: Opacity(
                            opacity: (1 - _animationLogoAndTextOut.value),
                            child: BatmanFirstScreenButtons(
                              _animationButtonsIn,
                              _onSignUpButton,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  ///THE BATMAN LOGO MUST BE ON TOP OF THE STACK...
                  Positioned(
                    top: MediaQuery.of(context).size.height / 2.0 -
                        (_batmanVerticalMovement + 20) *
                            _animationLogoMoveUp.value,
                    right: 0,
                    left: 0,
                    child: Opacity(
                      opacity: (1 - _animationLogoAndTextOut.value),
                      child: Transform.scale(
                        scale: _animationLogoIn.value,
                        child: Image.asset(
                          'assets/batman_logo.png',
                          height: 50,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
