import 'package:bmi/constants/color_manger.dart';
import 'package:bmi/constants/style_manager.dart';
import 'package:bmi/constants/values_manger.dart';
import 'package:bmi/provider/calculator_brain.dart';
import 'package:bmi/screens/widget/bottom_button.dart';
import 'package:bmi/screens/widget/card_content.dart';
import 'package:bmi/screens/widget/reusable_card.dart';
import 'package:bmi/screens/widget/round_button.dart';
import 'package:bmi/constants/color_manger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'result_page.dart';

enum GenderCardColor {
  male,
  female,
}
int height = 180;
int weight = 60;
int age = 18;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderCardColor selectedGender = GenderCardColor.male;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('BMI CALCULATOR'),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ResuableCard(
                    onPress: () {
                      //function inside class
                      setState(() {
                        selectedGender = GenderCardColor.male;
                      });
                    },
                    color: selectedGender == GenderCardColor.male
                        ? ColorManager.kActiveCardColor
                        : ColorManager.kInActiveCardColor,
                    cardChild: CardContent(
                      gender: 'MALE',
                      genderCard: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
                Expanded(
                  child: ResuableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = GenderCardColor.female;
                      });
                    },
                    color: selectedGender == GenderCardColor.female
                        ? ColorManager.kActiveCardColor
                        : ColorManager.kInActiveCardColor,
                    cardChild: CardContent(
                      gender: 'FEMALE',
                      genderCard: FontAwesomeIcons.venus,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ResuableCard(
              cardChild: Column(
                children: [
                  Text(
                    "Height",
                    style: getRegularStyle(color: ColorManager.kLabelColor,fontSize: FontSize.s18),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: getBoldStyle(color:Colors.white,fontSize: AppSize.s50)),
                      Text(
                        "cm",
                        style: getRegularStyle(color: ColorManager.kLabelColor,fontSize: FontSize.s18),
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x1FEB1555),
                      inactiveTrackColor: Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
              color: ColorManager.kActiveCardColor
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ResuableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Weight',
                          style: getRegularStyle(color: ColorManager.kLabelColor,fontSize: FontSize.s18),
                        ),
                        Text(
                          weight.toString(),
                          style:  getBoldStyle(color:Colors.white,fontSize: AppSize.s50),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    color: ColorManager.kActiveCardColor,
                  ),
                ),
                Expanded(
                  child: ResuableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Age',
                          style: getRegularStyle(color: ColorManager.kLabelColor,fontSize: FontSize.s18),
                        ),
                        Text(
                          age.toString(),
                          style:  getBoldStyle(color:Colors.white,fontSize: AppSize.s50),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                }),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                })
                          ],
                        )
                      ],
                    ),
                    color: ColorManager.kActiveCardColor,
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            title: 'CALCULATE',
            onTap: () {
              final brainNotifier = context.read<CalculatorNotifier>();
              brainNotifier.calculateBMI(height: height, weight: weight);
              brainNotifier.getResult();
              brainNotifier.getInterpretation();
              brainNotifier.getLinks();

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
