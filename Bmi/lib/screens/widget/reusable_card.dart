import 'package:flutter/material.dart';

class ResuableCard extends StatelessWidget {
  final Color color;
  final Widget cardChild;
  final Function()? onPress;
  ResuableCard({required this.color, required this.cardChild,  this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        )  ),
    );
  }
}
