import 'package:flutter/material.dart';

double widthPercent(double size, BuildContext context){
  return MediaQuery.of(context).size.width * (size / 100);
}

double heightPercent(double size, BuildContext context){
  return MediaQuery.of(context).size.height * (size / 100);
}