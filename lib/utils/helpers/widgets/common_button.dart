import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  const CommonButton(
      {Key? key,
      required this.onButtonPressed,
      this.label,
      this.hasIcon = false,
      this.labelWithIcon,
      this.padding = 10.0,
      this.verticalPadding = 0,
      this.fontSize = 14.0,
      this.hasBorder = false,
      this.textColor = Colors.white,
      this.horizontalPadding = 0,
      this.radius = 24.0,
      this.backgroundColor = Colors.black})
      : super(key: key);

  final VoidCallback onButtonPressed;
  final String? label;
  final bool? hasIcon;
  final Widget? labelWithIcon;
  final double? padding;
  final Color? backgroundColor;
  final double? verticalPadding;
  final double? fontSize;
  final bool? hasBorder;
  final Color? textColor;
  final double? radius;
  final double? horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding!, vertical: verticalPadding!),
      child: ElevatedButton(
        onPressed: onButtonPressed,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                hasBorder! ? Colors.white : backgroundColor),
            overlayColor: MaterialStateProperty.all(
                hasBorder! ? Colors.grey.shade100 : null),
            shape: !hasBorder!
                ? MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(radius!)))
                : MaterialStateProperty.all(RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(24.0)))),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: padding!),
          child: hasIcon!
              ? labelWithIcon
              : Text(
                  label!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: hasBorder! ? Colors.black : textColor,
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold),
                ),
        ),
      ),
    );
  }
}
