import 'package:flutter/material.dart';

class TableHeaderWidget extends StatelessWidget {
  final double screenWidth;

  const TableHeaderWidget({
    super.key,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: screenWidth * 0.32,
          child: const Text(
            'Turf Name',
            textAlign: TextAlign.start,
          ),
        ),
        const Text('Timings'),
        const Text('Status'),
        const Text('Edit'),
      ],
    );
  }
}
