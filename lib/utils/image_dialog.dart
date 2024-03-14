import 'package:flutter/material.dart';

Widget imageDialog(image, context) {
return Dialog(
  child: Image.asset(
    image,
    fit: BoxFit.fill,
  ),
);}