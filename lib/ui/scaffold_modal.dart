import 'package:flutter/material.dart';
import 'package:product_catalog/utils/constants.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showScaffoldModal({
  required BuildContext context,
  required String message,
  int? duration,
  Color? backgroundColor,
  Color? textColor,
  bool displayOnTop = false,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      margin: displayOnTop ? EdgeInsets.only(bottom: MediaQuery.of(context).size.height - 140, left: 10, right: 10) : null,
      dismissDirection: displayOnTop ? DismissDirection.up : DismissDirection.down,
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: duration ?? 4),
      backgroundColor: backgroundColor ?? kColorScheme.error,
      content: Text(
        message,
        style: kBaseTextStyle(
          fontSize: 15,
          color: textColor ?? Colors.white,
        ),
      ),
    ),
  );
}
