import 'dart:ui';
import 'package:flutter/material.dart';

class BackgroundDrawer extends StatelessWidget {
  const BackgroundDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
        child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Container(
        decoration: BoxDecoration(color: Colors.grey.shade200.withOpacity(.5)),
      ),
    ));
  }
}
