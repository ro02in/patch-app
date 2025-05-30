//NYTT FÖRSÖK NY BRANCH

/***********************************************************************************************************************************************************************************************************************************/
/*KÄLLHÄNVISNING: All kod i denna fil är från följande Youtube video 'Animated Gradient Border with GLOW in Flutter', youtu.be/Vwd26lP2MpY?si=nPAojP4odnrmo02V av kanalen The Dev Logger publicerad 25 maj 2024, hämtad 6 maj 2025 */
/***********************************************************************************************************************************************************************************************************************************/

/*import 'package:flutter/material.dart';

class AnimatedGradientBorder extends StatefulWidget {
  const AnimatedGradientBorder({super.key});

  @override
  State<AnimatedGradientBorder> createState() => _AnimatedGradientBorderState();
}

class _AnimatedGradientBorderState extends State<AnimatedGradientBorder> {
  with SingleTickerProviderStateMixin {
    late AnimationController _controller;
    late Animation<Alignment> _tlAlignAnim;
    late Animation<Alignment> _brAlignAnim;

    @override
    void initState() {
      super.initState();
      _controller = AnimationController(
        duration: const Duration(seconds: 2),
        vsync: this,
      );

    _tlAlignAnim = TweenSequence<Alignment> ([
      TweenSequenceItem(
        tween: 
          Tween<Alignment>(
          begin: Alignment.topLeft, end: Alignment.topRight),
          weight: 1,
        ),
      TweenSequenceItem(
        tween: 
          Tween<Alignment>(
          begin: Alignment.topRight, end: Alignment.bottomRight),
          weight: 1,
        ),
      TweenSequenceItem(
        tween: 
          Tween<Alignment>(
          begin: Alignment.bottomRight, end: Alignment.bottomLeft),
          weight: 1, 
        ),
      TweenSequenceItem(
        tween: 
          Tween<Alignment>(
          begin: Alignment.bottomLeft, end: Alignment.topLeft),
          weight: 1, 
        ),
    ]).animate(_controller);


    _brAlignAnim = TweenSequence<Alignment>([
      TweenSequenceItem<Alignment>(
        tween: Tween<Alignment>(
          begin: Alignment.bottomRight, end: Alignment.bottomLeft),
          weight: 1,
        ),
      TweenSequenceItem<Alignment>(
        tween: Tween<Alignment>(
          begin: Alignment.bottomLeft, end: Alignment.topLeft),
          weight: 1,
        ),
      TweenSequenceItem<Alignment>(
        tween: Tween<Alignment>(
          begin: Alignment.topLeft, end: Alignment.topRight),
          weight: 1,
        ),
      TweenSequenceItem<Alignment>(
        tween: Tween<Alignment>(
          begin: Alignment.topRight, end: Alignment.bottomRight),
          weight: 1,
        ),
    ]).animate(_controller);

    _controller.repeat();
  } //initState method

      @override
      Widget build(BuildContext context) {
        return ClipPath(
          clipper: _CenterCutPath(radius: 20, thickness: 2),
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, _) {
            return Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: _tlAlignAnim.value,
                end: _brAlignAnim.value,
                colors: [Colors.amber, Colors.limeAccent],
                ),
            ),
          );
                }),
        );
    }
  }
} //whole class

class _CenterCutPath extends CustomClipper<Path> {
  final double radius;
  final double thickness;
  _CenterCutPath({
    this.radius = 0,
    this.thickness = 1,
  });

  @override
  Path getClip(Size size) {
    final rect = Rect.fromLTRB(
      -size.width, -size.width, size.width*2, size.height*2);
      final double width = size.width - thickness *2;
      final double height = size.height - thickness *2;

      final path = Path()
      ..fillType = PathFillType.evenOdd
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(thickness, thickness, width, height),
          Radius.circular(radius-thickness),
          ),
      )
      ..addRect(rect);

      return path;
  }

  @override
  bool shouldReclip(covariant _CenterCutPath oldClipper) {
      return oldClipper.radius != radius || oldClipper.thickness != thickness;
  }
}
*/

//NYTT FÖRSÖK NY BRANCH