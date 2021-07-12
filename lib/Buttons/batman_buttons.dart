import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' as vector;

const _imageColor = Colors.black26;

class BatmanButton extends StatelessWidget {
  const BatmanButton(
      {Key? key, required this.onTap, required this.text, this.left = true})
      : super(key: key);

  final VoidCallback onTap;
  final String text;
  final bool left;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xfffde86a),
      child: InkWell(
        onTap: onTap,
        child: ClipRect(
          child: SizedBox(
            height: 62,
            child: Stack(
              children: [
                if (left)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..translate(-10.0)
                        ..rotateZ(
                          vector.radians(35),
                        ),
                      child: Image.asset(
                        'assets/batman_logo.png',
                        color: _imageColor,
                        height: 40,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                Center(
                  child: Text(
                    text,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (!left)
                  Align(
                    alignment: Alignment.centerRight,
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..translate(10.0)
                        ..rotateZ(
                          vector.radians(-35),
                        ),
                      child: Image.asset(
                        'assets/batman_logo.png',
                        color: _imageColor,
                        height: 40,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
