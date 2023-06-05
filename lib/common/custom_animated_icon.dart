import 'package:ecosofe_app/common/utils/app_colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomAnimatedIcon extends StatelessWidget {
  const CustomAnimatedIcon(
      {Key? key,
      required this.onPressFun,
      required this.firstIcon,
      required this.secondIcon,
      this.toggle = false,
      this.scaleNotFadeTransition = false,
      this.iconColor,
      this.animatedDuration = 300})
      : super(key: key);
  final VoidCallback onPressFun;
  final IconData firstIcon;
  final IconData secondIcon;
  final Color? iconColor;
  final bool scaleNotFadeTransition;

  final bool toggle;
  final int animatedDuration;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressFun,
      child: AnimatedSwitcher(
          duration: Duration(milliseconds: animatedDuration),
          transitionBuilder: (child, anim) => scaleNotFadeTransition
              ? RotationTransition(
                  turns: child.key == const ValueKey('icon1')
                      ? Tween<double>(begin: 1, end: 0.75).animate(anim)
                      : Tween<double>(begin: 0.75, end: 1).animate(anim),
                  child: ScaleTransition(scale: anim, child: child),
                )
              : FadeTransition(
                  opacity: child.key == const ValueKey('icon1')
                      ? Tween<double>(begin: 1, end: 0.75).animate(anim)
                      : Tween<double>(begin: 0.75, end: 1).animate(anim),
                  child: FadeTransition(opacity: anim, child: child)),
          child: toggle
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Icon(
                    firstIcon,
                    key: const ValueKey('icon1'),
                    color: iconColor ?? AppColors.textPrimaryColor.withOpacity(.5),
                  ),
                )
              : Icon(
                  secondIcon,
                  key: const ValueKey('icon2'),
                  color: iconColor ?? AppColors.textSecondaryColor.withOpacity(.5),
                )),
    );
  }
}
