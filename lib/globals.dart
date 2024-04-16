import 'package:flutter/material.dart';
import 'package:gender_reveal/main.dart';

Color boyColor = const Color(0xFF3980D0);
Color girlColor = const Color(0xFFF490BB);

globalSnackBar({required String message}) {
  ScaffoldMessenger.of(rootNavigatorKey.currentContext!).showSnackBar(
    SnackBar(
      content: Text(message),
    ),
  );
}
