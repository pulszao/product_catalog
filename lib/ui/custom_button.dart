import 'package:flutter/material.dart';
import 'package:product_catalog/constants.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final IconData? materialIcon;
  final void Function() onPressed;
  final double? width;
  final double elevation;

  const CustomButton({
    super.key,
    required this.text,
    this.backgroundColor,
    this.textColor,
    this.materialIcon,
    required this.onPressed,
    this.width,
    this.elevation = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      height: 57,
      child: Material(
        elevation: elevation,
        color: backgroundColor ?? kColorScheme.primary,
        borderRadius: BorderRadius.circular(25),
        child: MaterialButton(
          onPressed: onPressed,
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 7.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (materialIcon != null)
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Icon(
                          materialIcon,
                          size: 20.0,
                          color: textColor ?? kColorScheme.surface,
                        ),
                      ),
                    Text(
                      text,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: kBaseTextStyle(
                        color: textColor ?? kColorScheme.surface,
                        fontSize: 15.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
