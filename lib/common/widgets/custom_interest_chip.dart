import 'package:flutter/material.dart';
import 'package:service_booking_app/utils/styles.dart';

import '../../../utils/dimensions.dart';

class CustomInterestChip extends StatelessWidget {
  final String name;
  final bool isSelected;

  const CustomInterestChip({
    super.key,
    required this.name,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue : Colors.white,
        border: Border.all(
          color: isSelected ? Colors.blue : Colors.grey,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        name,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
