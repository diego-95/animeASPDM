import 'package:flutter/material.dart';

class DrawerRow extends StatelessWidget {
  const DrawerRow(
      {Key? key,
      required this.text,
      required this.icon,
      required this.selected,
      this.onTap})
      : super(key: key);
  final String text;
  final IconData icon;
  final bool selected;
  final void Function()? onTap;

  BoxDecoration? getBoxDecoration() {
    if (selected) {
      return const BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.all(Radius.circular(45)));
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Material(
          borderOnForeground: true,
          color: Colors.transparent,
          child: Ink(
            decoration: getBoxDecoration(),
            child: InkWell(
              customBorder: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(45))),
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 24),
                      child: Icon(
                        icon,
                        color: selected ? Colors.white : Colors.black,
                        size: 24,
                      ),
                    ),
                    Text(
                      text,
                      style: TextStyle(
                          fontSize: 16,
                          color: selected ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
