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
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../widget/text_field_widget.dart';
import 'result_page.dart';

enum GenderCardColor {
  male,
  female,
}


class InputPage extends HookWidget {
  const InputPage({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<GenderCardColor> selectedGender =useState<GenderCardColor>( GenderCardColor.male);
    ValueNotifier height = useState<int>(180);
    ValueNotifier weight = useState<int>(60);

    final weightController = useTextEditingController(text:weight.value.toString());
    ValueNotifier age = useState<int>(18);

    final ageController = useTextEditingController(text: age.value.toString());


    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('BMI CALCULATOR'),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height-100.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: ResuableCard(
                        onPress: () {
                          //function inside class

                            selectedGender.value = GenderCardColor.male;

                        },
                        color: selectedGender.value == GenderCardColor.male
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
                            selectedGender.value = GenderCardColor.female;
                        },
                        color: selectedGender.value == GenderCardColor.female
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                          Text(height.value.toString(), style: getBoldStyle(color:Colors.white,fontSize: AppSize.s50)),
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
                          value: height.value.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          onChanged: (double newValue) {

                              height.value = newValue.round();

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
                            TextFormFieldCustom(
                              controller: weightController,
                                inputType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                onChanged: (value){
                                   weight.value = int.parse(value);

                                },
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                      weight.value--;
                                      weightController.text = weight.value.toString();

                                  },
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                      weight.value++;
                                      weightController.text = weight.value.toString();

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
                            TextFormFieldCustom(
                              controller: ageController,
                              inputType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              onChanged: (value){
                                age.value = int.parse(value);
                              },
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                    icon: FontAwesomeIcons.minus,
                                    onPressed: () {
                                        age.value--;
                                        ageController.text = age.value.toString();
                                    }),
                                SizedBox(
                                  width: 10,
                                ),
                                RoundIconButton(
                                    icon: FontAwesomeIcons.plus,
                                    onPressed: () {
                                        age.value++;
                                        ageController.text = age.value.toString();

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
                  brainNotifier.calculateBMI(height: height.value, weight: weight.value);
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
        ),
      ),
    );
  }
}
