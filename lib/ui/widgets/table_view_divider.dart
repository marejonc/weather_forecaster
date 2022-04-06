import 'package:flutter/material.dart';

class TableDivider extends StatelessWidget {
  const TableDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SizedBox(
        height: 1.0,
        width: double.infinity,
        child: Container(
          color: Colors.black54,
        ),
      ),
    );
  }
}
