import 'package:flutter/material.dart';

class SingleTableInfo extends StatelessWidget {
  const SingleTableInfo({Key? key, this.textInfo = ''}) : super(key: key);

  final String textInfo;

  @override
  Widget build(BuildContext context) {
    return Text(
      textInfo,
      style: const TextStyle(
        fontSize: 17.0,
      ),
    );
  }
}
