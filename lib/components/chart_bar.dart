import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double value;
  final double percentage;

  ChartBar({
    this.label,
    this.percentage,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Column(
        children: [
          Container(
            height: constraints.maxHeight * .15,
            child: FittedBox(
              child: Text('${value.toStringAsFixed(2)}'),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: constraints.maxHeight * .05),
            height: constraints.maxHeight * .6,
            width: 10,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                    color: Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: percentage,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: constraints.maxHeight * .15,
            child: FittedBox(
              child: Text(label),
            ),
          ),
        ],
      );
    });
  }
}
