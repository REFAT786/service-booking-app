import 'package:flutter/material.dart';

class CustomImageDecoration extends StatelessWidget {
  const CustomImageDecoration({super.key, required this.imageName});
  final String imageName;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(imageName,fit: BoxFit.cover,)
    );
  }
}
