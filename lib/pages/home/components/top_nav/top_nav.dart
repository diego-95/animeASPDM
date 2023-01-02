import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TopNav extends StatefulWidget {
  const TopNav({Key? key}) : super(key: key);

  @override
  State<TopNav> createState() => _TopNavState();
}

class _TopNavState extends State<TopNav> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.25),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 5))
          ]),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Icon(
                Icons.account_circle,
                size: 34,
              ),
              Text("Hi Guest, please log-in", style: TextStyle(fontSize: 16)),
              Icon(Icons.menu)
            ]),
      ),
    );
  }
}
