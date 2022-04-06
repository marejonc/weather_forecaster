import 'package:flutter/material.dart';

class SingleCard extends StatelessWidget {
  const SingleCard({Key? key, required this.cardChild}) : super(key: key);

  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black45,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: cardChild,
      ),
    );
  }
}
