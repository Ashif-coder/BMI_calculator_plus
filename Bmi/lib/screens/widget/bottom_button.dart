import 'package:bmi/constants/color_manger.dart';
import 'package:bmi/constants/style_manager.dart';
import 'package:bmi/constants/values_manger.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final String title;
  final Function() onTap;
  BottomButton({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            title,
            style: getBoldStyle(color: Colors.white,fontSize: FontSize.s26),
          ),
        ),
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: AppPadding.p50,
        decoration: BoxDecoration(
          color: ColorManager.kBottomCardColor,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
