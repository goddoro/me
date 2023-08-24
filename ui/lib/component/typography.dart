import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DoroText extends Text {
  const DoroText(String data, {Key? key})
      : super(
    data,
    key: key,
    style: const TextStyle(fontSize: 16.0, color: Colors.black),
  );
}