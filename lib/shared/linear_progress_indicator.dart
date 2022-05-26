import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habit_app/constants/constants.dart';

class AnimatedLinearProgressIndicator extends StatefulWidget {
  final double progress;

  AnimatedLinearProgressIndicator({required this.progress});

  @override
  State<AnimatedLinearProgressIndicator> createState() =>
      _AnimatedLinearProgressIndicatorState();
}

class _AnimatedLinearProgressIndicatorState
    extends State<AnimatedLinearProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  final su = ScreenUtil();

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, ch) {
        return SizedBox(
          width: su.screenWidth,
          child: LinearProgressIndicator(
            value: _animationController.value * widget.progress,
            backgroundColor: Color(0xff1c232d),
            valueColor: AlwaysStoppedAnimation(
              cyan,
            ),
          ),
        );
      },
    );
  }
}
