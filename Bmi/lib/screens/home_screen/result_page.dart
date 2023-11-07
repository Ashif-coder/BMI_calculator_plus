import 'package:bmi/constants/color_manger.dart';
import 'package:bmi/constants/style_manager.dart';
import 'package:bmi/provider/calculator_brain.dart';
import 'package:bmi/screens/web_screen/webview_page.dart';
import 'package:bmi/screens/widget/bottom_button.dart';
import 'package:bmi/screens/widget/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ResultPage extends StatelessWidget {

    const ResultPage(
      {super.key,});

  @override
  Widget build(BuildContext context) {
    final brainNotifier = context.read<CalculatorNotifier>();
    final String interpretation= brainNotifier.getBmiResultDes;
    final String getResult= brainNotifier.getBmiResult;
    final String bmiResult= brainNotifier.getBmi;
    final String bmiLinks= brainNotifier.getBmiResultLinks;
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: getBoldStyle(color: Colors.white,fontSize: FontSize.s40),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              child: ResuableCard(
                color: ColorManager.kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      getResult,
                      style: getRegularStyle(color: ColorManager.kGreenColor,fontSize: FontSize.s22),
                    ),
                    Text(
                      bmiResult,
                      style: getRegularStyle(color: Colors.white,fontSize: FontSize.s70),
                    ),
                    Text(
                      interpretation,
                      style: getRegularStyle(color: Colors.white,fontSize: FontSize.s18),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => ConditionWebViewScreen(url: bmiLinks,title: "BMI Result Web view",isHTML: false,))),
                      child: Text(
                        "Know More About your BMI result",
                        style: getRegularStyle(color: ColorManager.kLinkColor,fontSize: FontSize.s16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          BottomButton(
              title: 'RE-CALCULATE',
              onTap: () {
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}
