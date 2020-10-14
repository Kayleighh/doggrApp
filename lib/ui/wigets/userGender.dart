import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget userGender(gender) {
  switch (gender) {
    case 'Dog':
      return Icon(
        FontAwesomeIcons.dog,
        color: Colors.white,
      );
      break;
    case 'Human':
      return Icon(
        FontAwesomeIcons.male,
        color: Colors.white,
      );
      break;
    default:
      return null;
      break;
  }
}