import 'package:flutter/cupertino.dart';

extension DetectDirectionText on TextEditingController{

  TextDirection get detectDirection{
    return RegExp(r'^[a-zA-Z0-9?><;,{}[\]\-_+=!@#$%^&*|]*$').hasMatch(text) ?
        TextDirection.ltr :
        TextDirection.rtl;
  }

}