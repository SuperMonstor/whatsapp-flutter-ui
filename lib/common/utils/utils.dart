import 'package:flutter/material.dart';

void showSnackBar({required BuildContext context, required String content}) {
  SnackBar(
    content: Text(content),
  );
}
