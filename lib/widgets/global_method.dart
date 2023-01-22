import 'package:flutter/material.dart';

navigationTo({context, screen}) {
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return screen;
  }));
}

pop({context}) {
  Navigator.pop(context);
}

navigationAndFinsh({context, screen}) {
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
    return screen;
  }));
}
