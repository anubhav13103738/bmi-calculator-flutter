import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reuseable_card.dart';
import 'constants.dart';
import 'results_page.dart';
import 'calculator_brain.dart';

enum Genders { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Genders selectedGender;
  int height = 180;
  int weight = 65;
  int age = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: ReuseableContainerWidget(
                    onPress: () {
                      setState(() {
                        selectedGender = Genders.male;
                      });
                    },
                    colour: selectedGender == Genders.male
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    borderColour: selectedGender == Genders.male
                        ? kBottomContainerColour
                        : kInactiveCardColour,
                    cardChild: CardChild(
                      cardIcon: FontAwesomeIcons.mars,
                      cardText: 'MALE',
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  flex: 2,
                  child: ReuseableContainerWidget(
                    onPress: () {
                      setState(() {
                        selectedGender = Genders.female;
                      });
                    },
                    colour: selectedGender == Genders.female
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    borderColour: selectedGender == Genders.female
                        ? kBottomContainerColour
                        : kInactiveCardColour,
                    cardChild: CardChild(
                      cardIcon: FontAwesomeIcons.venus,
                      cardText: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReuseableContainerWidget(
                    colour: kActiveCardColour,
                    borderColour: kBorderColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'HEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              height.toString(),
                              style: kSelectHeightTextstyle,
                            ),
                            Text(
                              'cm',
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbColor: kBottomContainerColour,
                            activeTrackColor: kBottomContainerColour,
                            inactiveTrackColor: Color(0xFF8D8E98),
                            overlayColor: Color(0x29EB1555),
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 23),
                          ),
                          child: Slider(
                            value: height.toDouble(),
                            min: 120,
                            max: 220,
//                            activeColor: kBottomContainerColour,

                            onChanged: (double newValue) {
                              setState(() {
//                              print('newVale $newValue');
                                height = newValue.round();
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: ReuseableContainerWidget(
                    colour: kActiveCardColour,
                    borderColour: kBorderColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kSelectHeightTextstyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: Icons.remove,
                              function: () {
                                setState(() {
                                  if (weight > 5) {
                                    weight--;
                                  }
                                });
                              },
                            ),
                            SizedBox(width: 10),
                            RoundIconButton(
                              icon: Icons.add,
                              function: () {
                                setState(() {
                                  if (weight < 400) {
                                    weight++;
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  flex: 2,
                  child: ReuseableContainerWidget(
                    colour: kActiveCardColour,
                    borderColour: kBorderColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kSelectHeightTextstyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: Icons.remove,
                              function: () {
                                setState(() {
                                  if (age > 3) {
                                    age--;
                                  }
                                });
                              },
                            ),
                            SizedBox(width: 10),
                            RoundIconButton(
                                icon: Icons.add,
                                function: () {
                                  setState(() {
                                    if (age < 160) {
                                      age++;
                                    }
                                  });
                                }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      CalculatorBrain calc =
                          CalculatorBrain(height: height, weight: weight);
                      calc.calculateBMI();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultsPage(
                            bmiResult: calc.calculateBMI(),
                            resultText: calc.getResult(),
                            interpretation: calc.getInterpretation(),
                          ),
                        ),
                      );
                    },
                    child: Container(
                      child: Center(
                        child: Text(
                          'CALCULATE',
                          style: kSelectHeightTextstyle,
                        ),
                      ),
                      color: kBottomContainerColour,
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.only(bottom: 20),
                      height: kBottomContainerHeight.toDouble(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.function});

  final IconData icon;

  final Function function;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: function,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      elevation: 6,
    );
  }
}
