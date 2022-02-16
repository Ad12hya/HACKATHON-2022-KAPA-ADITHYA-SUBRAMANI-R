import 'package:flutter/material.dart';

const colorWhite = Colors.white;
const colorGrey = Color.fromRGBO(141, 141, 141, 1.0);
const colorDarkBlue = Color.fromRGBO(20, 25, 45, 1.0);
const colorBlack = Color.fromRGBO(48, 47, 48, 1.0);
const TextTheme textThemeDefault = TextTheme(
    headline1:
        TextStyle(color: colorBlack, fontWeight: FontWeight.w700, fontSize: 32),
    headline2:
        TextStyle(color: colorBlack, fontWeight: FontWeight.w700, fontSize: 22),
    headline3:
        TextStyle(color: colorBlack, fontWeight: FontWeight.w700, fontSize: 20),
    headline4:
        TextStyle(color: colorBlack, fontWeight: FontWeight.w700, fontSize: 16),
    headline5:
        TextStyle(color: colorBlack, fontWeight: FontWeight.w700, fontSize: 14),
    headline6:
        TextStyle(color: colorBlack, fontWeight: FontWeight.w700, fontSize: 12),
    bodyText1: TextStyle(
        color: colorBlack,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 1.5),
    bodyText2: TextStyle(
        color: colorGrey,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 1.5),
    subtitle1:
        TextStyle(color: colorBlack, fontSize: 12, fontWeight: FontWeight.w400),
    subtitle2:
        TextStyle(color: colorGrey, fontSize: 12, fontWeight: FontWeight.w400));
