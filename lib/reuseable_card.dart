import 'package:flutter/material.dart';

class ReuseableContainerWidget extends StatelessWidget {
  ReuseableContainerWidget(
      {@required this.colour,
      @required this.borderColour,
      this.cardChild,
      this.onPress});

  final Color colour;
  final Color borderColour;
  final Widget cardChild;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            width: 2.0,
            color: borderColour,
          ),
        ),
      ),
    );
  }
}
