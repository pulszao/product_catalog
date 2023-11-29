import 'package:flutter/material.dart';

bool kDebugMode = true;

ColorScheme kColorScheme = const ColorScheme(
  background: Color(0xFFFFFFFF),
  surface: Color(0xFFFFFFFF),
  primary: Color(0xFF2F5DA8),
  secondary: Color(0xff1E2224),
  onBackground: Color(0xFFE6E6E6),
  onSurface: Color(0xFF1E1E1E),
  onPrimary: Color(0xFFFFFFFF),
  onSecondary: Color(0xFFFFFFFF),
  error: Color(0xFFE74C3C),
  onError: Color(0xFFFFFFFF),
  brightness: Brightness.light,
  outline: Color(0xFFD3D3D3), // BaseShimmerColor
  outlineVariant: Color(0xFFE3E3E3), //HighlightShimmerColor
);

TextStyle kBaseTextStyle({double? fontSize, Color? color, FontWeight? fontWeight, TextDecoration? decoration, Paint? background}) {
  return TextStyle(
    fontSize: fontSize ?? 15,
    color: color ?? Colors.black,
    fontWeight: fontWeight ?? FontWeight.normal,
    decoration: decoration,
    background: background,
  );
}

AppBar kBuildAppBar(BuildContext context, String label) {
  return AppBar(
    toolbarHeight: 60.0,
    automaticallyImplyLeading: false,
    backgroundColor: kColorScheme.background,
    centerTitle: true,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        IconButton(
          highlightColor: Colors.transparent,
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.close),
        ),
      ],
    ),
  );
}
